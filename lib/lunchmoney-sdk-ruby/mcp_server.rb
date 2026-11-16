# frozen_string_literal: true

require 'lunchmoney-sdk-ruby'
require 'mcp'

module LunchMoney
  # Optional read-only adapter. Normal SDK use does not load MCP or its transports.
  module MCPServer
    SPEC_PATH = File.expand_path('../../openapi/lunchmoney-v2.json', __dir__)

    def self.build(client: nil)
      unless client
        config = Configuration.new
        config.access_token = ENV.fetch('LUNCHMONEY_ACCESS_TOKEN')
        raise ArgumentError, 'LUNCHMONEY_ACCESS_TOKEN must not be empty' if config.access_token.strip.empty?

        config.timeout = 30
        config.logger = Logger.new($stderr)
        client = ApiClient.new(config)
      end

      spec = JSON.parse(File.read(SPEC_PATH))
      tools = spec.fetch('paths').filter_map do |path, operations|
        operation = operations['get']
        next unless operation

        define_tool(client, path, operation)
      end
      ::MCP::Server.new(name: 'lunchmoney', version: VERSION, tools: tools)
    end

    def self.define_tool(client, path, operation)
      parameters = operation.fetch('parameters', [])
      properties = parameters.to_h do |parameter|
        schema = parameter.fetch('schema').dup
        # Formats are advisory in some JSON Schema validators. anyOf avoids
        # rejecting timestamps that match both string alternatives structurally.
        schema['anyOf'] = schema.delete('oneOf') if schema.key?('oneOf')
        [parameter.fetch('name'), schema]
      end
      name = operation.fetch('operationId').gsub(/([a-z\d])([A-Z])/, '\1_\2').downcase
      ::MCP::Tool.define(
        name: "lunchmoney_#{name}", description: operation.fetch('summary'),
        annotations: { read_only_hint: true, destructive_hint: false,
                       idempotent_hint: true, open_world_hint: true },
        input_schema: { type: 'object', properties: properties,
                        required: parameters.select { |p| p['required'] }.map { |p| p.fetch('name') },
                        additionalProperties: false }
      ) do |**arguments|
        arguments.delete(:server_context)
        resolved_path = path.dup
        query = arguments.dup
        parameters.select { |p| p['in'] == 'path' }.each do |parameter|
          key = parameter.fetch('name')
          resolved_path = resolved_path.gsub("{#{key}}", query.delete(key.to_sym).to_s)
        end
        begin
          data, = client.call_api(:GET, resolved_path, query_params: query,
                                 auth_names: ['cookieAuth', 'bearerSecurity'], return_type: 'Object')
          structured = data.is_a?(Hash) ? data : { data: data }
          ::MCP::Tool::Response.new([{ type: 'text', text: JSON.generate(data) }], structured_content: structured)
        rescue ApiError => error
          message = "Lunch Money API request failed (HTTP #{error.code || 'unavailable'}). " \
                    'Check LUNCHMONEY_ACCESS_TOKEN, request parameters, and API availability.'
          ::MCP::Tool::Response.new([{ type: 'text', text: message }], error: true)
        end
      end
    end

    def self.run(http: false, port: 9294, client: nil)
      server = build(client: client)
      unless http
        return ::MCP::Server::Transports::StdioTransport.new(server).open
      end

      require 'rackup/handler/webrick'
      transport = ::MCP::Server::Transports::StreamableHTTPTransport.new(
        server, stateless: true, enable_json_response: true
      )
      server.transport = transport
      app = ->(env) { transport.handle_request(Rack::Request.new(env)) }
      Rackup::Handler::WEBrick.run(
        Rack::Builder.new { map('/mcp') { run app } },
        Host: '127.0.0.1', Port: port,
        Logger: WEBrick::Log.new($stderr, WEBrick::Log::WARN), AccessLog: []
      )
    end

    private_class_method :define_tool
  end
end
