# Lunch Money MCP

The optional server uses the official Ruby MCP SDK 1.10 and supports the current
[2026-07-28 protocol](https://modelcontextprotocol.io/specification/2026-07-28),
plus initialization-based clients using 2025-11-25. Both stdio and Streamable HTTP
are supported. Protocol negotiation is handled by the SDK.

The 16 tools expose every GET operation in the bundled OpenAPI specification:
user profile, budget summary and settings, categories, manual accounts, Plaid
accounts, transactions, attachment URLs, tags, and recurring items. Tool names
begin with `lunchmoney_`, for example `lunchmoney_get_all_transactions`.
This server only reads data; the Ruby SDK still supports its full set of APIs.

## Install and run

From this checkout, use Ruby 4.0.9 and run `bundle install`. MCP dependencies
are in the `mcp` Gemfile group. Ordinary gem consumers continue to install only
HTTPX and logger. To use the executable from an installed gem, also run
`gem install mcp -v '~> 1.10'` and `gem install rackup webrick`.

Set `LUNCHMONEY_ACCESS_TOKEN` in your environment using your normal secret
management. Never place the token in command arguments or commit it to Git.

```sh
bin/lunchmoney-mcp
# Or serve local Streamable HTTP:
bin/lunchmoney-mcp --http --port 9294
```

Stdio uses newline-delimited JSON on stdout and sends diagnostics to stderr.
The HTTP endpoint is `http://127.0.0.1:9294/mcp`. It uses stateless JSON
responses and SDK Host/Origin validation. It binds to loopback and uses the
server process's Lunch Money token; run it as a trusted local service.

## Claude and Codex

For a Claude Desktop stdio entry, add the following inside your MCP
configuration's `mcpServers` object. Set the token in the environment used to
launch the server (GUI apps may need an explicit `env` configuration).

```json
{
  "lunchmoney": {
    "command": "/opt/services/lunchmoney-sdk-ruby/bin/lunchmoney-mcp"
  }
}
```

For Codex, use a stdio entry in `~/.codex/config.toml`:

```toml
[mcp_servers.lunchmoney]
command = "/opt/services/lunchmoney-sdk-ruby/bin/lunchmoney-mcp"
env_vars = ["LUNCHMONEY_ACCESS_TOKEN"]
```

Or start the HTTP server and use:

```toml
[mcp_servers.lunchmoney]
url = "http://127.0.0.1:9294/mcp"
```

Use one entry per server. The executable works from other working directories
and loads dependencies from this checkout. Ensure its Ruby executable is on
the client's PATH, or configure an absolute Ruby 4.0.9 path as `command` and put
the script path in `args`.

## Testing

Run `bundle exec rake`. The transport tests launch subprocesses for both
protocol versions over HTTP and stdio. They execute real HTTPX requests against
a local fixture API, verify bearer authentication, validate tool arguments,
reject foreign origins, and check executable startup outside the checkout.
Tests do not require a real Lunch Money token or access financial accounts.
