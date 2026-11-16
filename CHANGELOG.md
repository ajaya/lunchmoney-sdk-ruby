# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- Optional `lunchmoney-mcp` executable with 16 read-only tools, structured responses, stdio and local Streamable HTTP transports.
- MCP 2026-07-28 and 2025-11-25 compatibility tests using the official Ruby SDK 1.10.0 and a local HTTP fixture API.

### Changed

- Use Ruby 4.0.9 and Bundler 4.0.24 for development and releases, while retaining Ruby 3.4 compatibility.
- Update HTTPX to 1.9.1 and lock development dependencies for reproducible builds.
- Update checkout and release actions and test Ruby 4.0.9 in CI.

## [2.9.0] - 2026-03-11

### Added

- Initial release tracking Lunch Money API spec v2.9.0
- Full API coverage: budgets, categories, manual accounts, Plaid accounts, recurring items, summary, tags, transactions (CRUD, bulk, files, groups, splits)
- Bearer token and cookie-based authentication support
