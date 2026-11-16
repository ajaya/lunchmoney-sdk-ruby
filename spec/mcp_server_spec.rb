# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Lunch Money MCP server' do
  let(:client) { LunchMoney::ApiClient.new(LunchMoney::Configuration.new) }

  def build_server
    require 'lunchmoney-sdk-ruby/mcp_server'
    LunchMoney::MCPServer.build(client: client)
  end

  def rpc(server, method, params = {})
    meta = { 'io.modelcontextprotocol/protocolVersion' => '2026-07-28',
             'io.modelcontextprotocol/clientCapabilities' => {} }
    JSON.parse(server.handle_json(JSON.generate(jsonrpc: '2.0', id: 1, method: method,
                                               params: params.merge(_meta: meta))))
  end

  it 'exposes every GET operation as a read-only tool' do
    tools = rpc(build_server, 'tools/list').dig('result', 'tools')
    expect(tools.size).to eq(16)
    expect(tools.map { |tool| tool.dig('annotations', 'readOnlyHint') }.uniq).to eq([true])
    expect(tools.map { |tool| tool['name'] }).to include('lunchmoney_get_all_transactions')
  end

  it 'executes filtered reads through the SDK and returns structured data' do
    expect(client).to receive(:call_api).with(:GET, '/transactions',
      query_params: { limit: 10, offset: 20, include_pending: false },
      auth_names: ['cookieAuth', 'bearerSecurity'], return_type: 'Object')
      .and_return([{ transactions: [{ id: 123 }] }, 200, {}])
    response = rpc(build_server, 'tools/call', name: 'lunchmoney_get_all_transactions',
                   arguments: { limit: 10, offset: 20, include_pending: false })
    expect(response.dig('result', 'structuredContent', 'transactions', 0, 'id')).to eq(123)
    expect(response.dig('result', 'isError')).to eq(false)
  end

  it 'substitutes validated path parameters' do
    expect(client).to receive(:call_api).with(:GET, '/transactions/123',
      query_params: {}, auth_names: ['cookieAuth', 'bearerSecurity'], return_type: 'Object')
      .and_return([{ id: 123 }, 200, {}])
    response = rpc(build_server, 'tools/call', name: 'lunchmoney_get_transaction_by_id', arguments: { id: 123 })
    expect(response.dig('result', 'structuredContent', 'id')).to eq(123)
  end

  it 'rejects extra arguments and invalid pagination before calling the API' do
    expect(client).not_to receive(:call_api)
    [{ debug_auth_names: [] }, { limit: 2001 }, { limit: 0 }].each do |arguments|
      response = rpc(build_server, 'tools/call', name: 'lunchmoney_get_all_transactions', arguments: arguments)
      expect(response['error'] || response.dig('result', 'isError')).to be_truthy
    end
  end

  it 'returns actionable upstream errors without leaking response headers or bodies' do
    expect(client).to receive(:call_api).and_raise(LunchMoney::ApiError.new(
                                                     code: 401, response_headers: { 'Set-Cookie' => 'secret' }, response_body: 'sensitive'))
    response = rpc(build_server, 'tools/call', name: 'lunchmoney_get_me', arguments: {})
    expect(response.dig('result', 'isError')).to eq(true)
    expect(response.to_s).to include('401', 'LUNCHMONEY_ACCESS_TOKEN')
    expect(response.to_s).not_to include('secret', 'sensitive')
  end

  it 'accepts timestamp filters without ambiguous oneOf string validation' do
    expect(client).to receive(:call_api).with(:GET, '/transactions',
      query_params: { created_since: '2026-11-01T12:30:00Z' },
      auth_names: ['cookieAuth', 'bearerSecurity'], return_type: 'Object')
      .and_return([{ transactions: [] }, 200, {}])
    response = rpc(build_server, 'tools/call', name: 'lunchmoney_get_all_transactions',
                   arguments: { created_since: '2026-11-01T12:30:00Z' })
    expect(response.dig('result', 'isError')).to eq(false)
  end
end
