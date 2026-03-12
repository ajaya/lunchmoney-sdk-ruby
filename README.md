# lunchmoney-sdk-ruby

Ruby SDK for the [Lunch Money](https://lunchmoney.app) API v2.

Auto-generated from the official [OpenAPI specification](https://lunchmoney.dev) using [OpenAPI Generator](https://openapi-generator.tech).

- API version: 2.9.0
- SDK version: 2.9.0

## Installation

Add to your Gemfile:

```ruby
gem 'lunchmoney-sdk-ruby', '~> 2.9'
```

Or install directly:

```sh
gem install lunchmoney-sdk-ruby
```

## Getting Started

```ruby
require 'lunchmoney-sdk-ruby'

LunchMoney.configure do |config|
  config.access_token = ENV['LUNCHMONEY_ACCESS_TOKEN']
end

# List all transactions
api = LunchMoney::TransactionsBulkApi.new
response = api.get_all_transactions
puts response.data

# Get current user
me_api = LunchMoney::MeApi.new
user = me_api.get_me
puts user.name
```

## API Endpoints

All URIs are relative to `https://api.lunchmoney.dev/v2`

| Class | Method | HTTP request | Description |
|-------|--------|--------------|-------------|
| `LunchMoney::BudgetsApi` | `delete_budget` | **DELETE** /budgets | Delete budget |
| `LunchMoney::BudgetsApi` | `get_budget_settings` | **GET** /budgets/settings | Get budget settings |
| `LunchMoney::BudgetsApi` | `upsert_budget` | **PUT** /budgets | Upsert budget |
| `LunchMoney::CategoriesApi` | `create_category` | **POST** /categories | Create a new category or category group |
| `LunchMoney::CategoriesApi` | `delete_category` | **DELETE** /categories/{id} | Delete a category or category group |
| `LunchMoney::CategoriesApi` | `get_all_categories` | **GET** /categories | Get all categories |
| `LunchMoney::CategoriesApi` | `get_category_by_id` | **GET** /categories/{id} | Get a single category |
| `LunchMoney::CategoriesApi` | `update_category` | **PUT** /categories/{id} | Update an existing category or category group |
| `LunchMoney::ManualAccountsApi` | `create_manual_account` | **POST** /manual_accounts | Create a manual account |
| `LunchMoney::ManualAccountsApi` | `delete_manual_account` | **DELETE** /manual_accounts/{id} | Delete a manual account |
| `LunchMoney::ManualAccountsApi` | `get_all_manual_accounts` | **GET** /manual_accounts | Get all manual accounts |
| `LunchMoney::ManualAccountsApi` | `get_manual_account_by_id` | **GET** /manual_accounts/{id} | Get a single manual account |
| `LunchMoney::ManualAccountsApi` | `update_manual_account` | **PUT** /manual_accounts/{id} | Update an existing manual account |
| `LunchMoney::MeApi` | `get_me` | **GET** /me | Get current user |
| `LunchMoney::PlaidAccountsApi` | `get_all_plaid_accounts` | **GET** /plaid_accounts | Get all Plaid accounts |
| `LunchMoney::PlaidAccountsApi` | `get_plaid_account_by_id` | **GET** /plaid_accounts/{id} | Get a single Plaid account |
| `LunchMoney::PlaidAccountsApi` | `trigger_plaid_account_fetch` | **POST** /plaid_accounts/fetch | Trigger fetch from Plaid |
| `LunchMoney::RecurringItemsApi` | `get_all_recurring` | **GET** /recurring_items | Get all recurring items |
| `LunchMoney::RecurringItemsApi` | `get_recurring_by_id` | **GET** /recurring_items/{id} | Get a single recurring item |
| `LunchMoney::SummaryApi` | `get_budget_summary` | **GET** /summary | Get summary |
| `LunchMoney::TagsApi` | `create_tag` | **POST** /tags | Create a new tag |
| `LunchMoney::TagsApi` | `delete_tag` | **DELETE** /tags/{id} | Delete a tag |
| `LunchMoney::TagsApi` | `get_all_tags` | **GET** /tags | Get all tags |
| `LunchMoney::TagsApi` | `get_tag_by_id` | **GET** /tags/{id} | Get a single tag |
| `LunchMoney::TagsApi` | `update_tag` | **PUT** /tags/{id} | Update an existing tag |
| `LunchMoney::TransactionsApi` | `delete_transaction_by_id` | **DELETE** /transactions/{id} | Delete a transaction |
| `LunchMoney::TransactionsApi` | `get_transaction_by_id` | **GET** /transactions/{id} | Get a single transaction |
| `LunchMoney::TransactionsApi` | `update_transaction` | **PUT** /transactions/{id} | Update an existing transaction |
| `LunchMoney::TransactionsBulkApi` | `create_new_transactions` | **POST** /transactions | Insert transactions |
| `LunchMoney::TransactionsBulkApi` | `delete_transactions` | **DELETE** /transactions | Bulk delete transactions |
| `LunchMoney::TransactionsBulkApi` | `get_all_transactions` | **GET** /transactions | Get all transactions |
| `LunchMoney::TransactionsBulkApi` | `update_transactions` | **PUT** /transactions | Update multiple transactions |
| `LunchMoney::TransactionsFilesApi` | `attach_file_to_transaction` | **POST** /transactions/{transaction_id}/attachments | Attach a file to a transaction |
| `LunchMoney::TransactionsFilesApi` | `delete_transaction_attachment` | **DELETE** /transactions/attachments/{file_id} | Delete a file attachment |
| `LunchMoney::TransactionsFilesApi` | `get_transaction_attachment_url` | **GET** /transactions/attachments/{file_id} | Get file attachment URL |
| `LunchMoney::TransactionsGroupApi` | `group_transactions` | **POST** /transactions/group | Create a transaction group |
| `LunchMoney::TransactionsGroupApi` | `ungroup_transactions` | **DELETE** /transactions/group/{id} | Delete a transaction group |
| `LunchMoney::TransactionsSplitApi` | `split_transaction` | **POST** /transactions/split/{id} | Split a transaction |
| `LunchMoney::TransactionsSplitApi` | `unsplit_transaction` | **DELETE** /transactions/split/{id} | Unsplit a transaction |

## Documentation

See the [docs/](docs/) directory for detailed model and API documentation.

## Authentication

Configure your Lunch Money access token:

```ruby
LunchMoney.configure do |config|
  # Option 1: Bearer token (recommended)
  config.access_token = 'your_access_token'

  # Option 2: Dynamic token via proc
  config.access_token_getter = -> { fetch_token_from_vault }
end
```

Get your access token from [Lunch Money Developer Settings](https://my.lunchmoney.app/developers).

## Development

```sh
bundle install
bundle exec rspec
```

## Contributing

Bug reports and pull requests are welcome on [GitHub](https://github.com/ajaya/lunchmoney-sdk-ruby).

## License

This gem is available as open source under the terms of the [MIT License](LICENSE).
