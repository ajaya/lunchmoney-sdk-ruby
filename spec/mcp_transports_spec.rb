# frozen_string_literal: true

require 'spec_helper'
require 'open3'
require 'rbconfig'
require 'net/http'
require 'socket'
require 'timeout'
require 'webrick'

RSpec.describe 'MCP transport compatibility' do
  MODERN = '2026-07-28'
  LEGACY = '2025-11-25'
  ROOT = File.expand_path('..', __dir__)
  SCRIPT = <<~'RUBY'
    require 'lunchmoney-sdk-ruby/mcp_server'
    config = LunchMoney::Configuration.new
    config.scheme = 'http'
    config.host = "127.0.0.1:#{ARGV[2]}"
    config.access_token = 'local-test-token'
    config.timeout = 3
    LunchMoney::MCPServer.run(http: ARGV[0] == 'http', port: ARGV[1].to_i,
                             client: LunchMoney::ApiClient.new(config))
  RUBY

  def rpc(id, method, params = {})
    { jsonrpc: '2.0', id: id, method: method, params: params }
  end

  def read_line(output)
    raise 'MCP response timed out' unless IO.select([output], nil, nil, 5)

    JSON.parse(output.gets || raise('MCP process closed stdout'))
  end

  def http_post(port, request, version, origin: nil)
    http = Net::HTTP.new('127.0.0.1', port, nil)
    http.read_timeout = http.open_timeout = 5
    headers = { 'Content-Type' => 'application/json', 'Accept' => 'application/json, text/event-stream',
                'MCP-Protocol-Version' => version }
    headers['Origin'] = origin if origin
    if version == MODERN
      headers['Mcp-Method'] = request[:method]
      headers['Mcp-Name'] = request.dig(:params, :name) if request.dig(:params, :name)
    end
    http.post('/mcp', JSON.generate(request), headers)
  end

  def with_server(mode)
    requests = Queue.new
    upstream = WEBrick::HTTPServer.new(BindAddress: '127.0.0.1', Port: 0,
      Logger: WEBrick::Log.new(File::NULL), AccessLog: [])
    upstream.mount_proc('/v2/me') do |request, response|
      requests << [request.request_method, request['Authorization']]
      response['Content-Type'] = 'application/json'
      response.body = JSON.generate(id: 123, name: 'Local Test')
    end
    upstream_thread = Thread.new { upstream.start }
    socket = TCPServer.new('127.0.0.1', 0)
    port = socket.addr[1]
    socket.close
    Open3.popen3(RbConfig.ruby, "-I#{ROOT}/lib", '-e', SCRIPT, mode, port.to_s, upstream.config[:Port].to_s) do |input, output, error, process|
      errors = Thread.new { error.read }
      if mode == 'http'
        Timeout.timeout(5) do
          loop do
            begin
              TCPSocket.new('127.0.0.1', port).close
              break
            rescue Errno::ECONNREFUSED
              raise "MCP server exited: #{errors.value}" unless process.alive?

              sleep 0.03
            end
          end
        end
      end
      yield input, output, port, requests
    ensure
      input.close unless input.closed?
      Process.kill('TERM', process.pid) if mode == 'http' && process.alive?
      unless process.join(3)
        Process.kill('KILL', process.pid)
        process.join
      end
      errors.join
    end
  ensure
    upstream&.shutdown
    upstream_thread&.join
  end

  ['stdio', 'http'].product([MODERN, LEGACY]).each do |mode, version|
    it "discovers and calls tools over #{mode} using #{version}, through real HTTPX requests" do
      with_server(mode) do |input, output, port, requests|
        exchange = lambda do |request|
          if mode == 'http'
            response = http_post(port, request, version)
            expect(response.code).to eq('200'), response.body
            JSON.parse(response.body)
          else
            input.puts(JSON.generate(request))
            input.flush
            read_line(output)
          end
        end
        meta = version == MODERN ? { _meta: { 'io.modelcontextprotocol/protocolVersion' => MODERN,
                                               'io.modelcontextprotocol/clientCapabilities' => {} } } : {}
        if version == MODERN
          expect(exchange.call(rpc(1, 'server/discover', meta)).dig('result', 'resultType')).to eq('complete')
        else
          initialized = exchange.call(rpc(1, 'initialize', protocolVersion: LEGACY,
            capabilities: {}, clientInfo: { name: 'test', version: '1' }))
          expect(initialized.dig('result', 'protocolVersion')).to eq(LEGACY)
          notification = { jsonrpc: '2.0', method: 'notifications/initialized' }
          if mode == 'http'
            expect(http_post(port, notification, version).code).to eq('202')
          else
            input.puts(JSON.generate(notification))
            input.flush
          end
        end
        tools = exchange.call(rpc(2, 'tools/list', meta)).dig('result', 'tools')
        expect(tools.size).to eq(16)
        result = exchange.call(rpc(3, 'tools/call', meta.merge(name: 'lunchmoney_get_me', arguments: {})))
        expect(result.dig('result', 'structuredContent', 'id')).to eq(123)
        expect(Timeout.timeout(3) { requests.pop }).to eq(['GET', 'Bearer local-test-token'])
        invalid = exchange.call(rpc(4, 'tools/call', meta.merge(name: 'lunchmoney_get_me', arguments: { unexpected: true })))
        expect(invalid['error'] || invalid.dig('result', 'isError')).to be_truthy
        if mode == 'http'
          expect(http_post(port, rpc(5, 'tools/list', meta), version, origin: 'https://foreign.example').code).to eq('403')
        end
      end
    end
  end

  it 'launches the stdio executable from outside the repo with clean JSON stdout' do
    env = { 'BUNDLE_GEMFILE' => nil, 'RUBYOPT' => nil, 'LUNCHMONEY_ACCESS_TOKEN' => 'local-test-token' }
    request = rpc(1, 'initialize', protocolVersion: LEGACY, capabilities: {}, clientInfo: { name: 'test', version: '1' })
    stdout, stderr, status = Open3.capture3(env, RbConfig.ruby, "#{ROOT}/bin/lunchmoney-mcp",
      stdin_data: "#{JSON.generate(request)}\n", chdir: '/tmp')
    expect(status.success?).to eq(true), stderr
    expect(JSON.parse(stdout).dig('result', 'protocolVersion')).to eq(LEGACY)
  end
end
