# LunchMoney::BudgetsApi

All URIs are relative to *https://api.lunchmoney.dev/v2*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**delete_budget**](BudgetsApi.md#delete_budget) | **DELETE** /budgets | Delete budget |
| [**get_budget_settings**](BudgetsApi.md#get_budget_settings) | **GET** /budgets/settings | Get budget settings |
| [**upsert_budget**](BudgetsApi.md#upsert_budget) | **PUT** /budgets | Upsert budget |


## delete_budget

> delete_budget(category_id, start_date)

Delete budget

Removes the budget for the given category and period. If there already is no budget set for that period, the request still succeeds (idempotent).<p> Note that `start_date` **must** be a valid budget period start for the account (based on the account's budget period settings). If an invalid `start_date` is provided, the request will fail with an error that indicates what the previous and next valid start dates are.<p> Use the [budgets/settings](#tag/budgets/GET/budgets/settings) endpoint to view the account's budget settings.<br> To view existing budgets details use the [summary](#tag/summary) endpoint.

### Examples

```ruby
require 'time'
require 'lunchmoney-sdk-ruby'
# setup authorization
LunchMoney.configure do |config|
  # Configure API key authorization: cookieAuth
  config.api_key['_lm_access_token'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['_lm_access_token'] = 'Bearer'

  # Configure Bearer authorization (JWT): bearerSecurity
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = LunchMoney::BudgetsApi.new
category_id = 56 # Integer | Category ID of the budget to delete
start_date = Date.parse('2013-10-20') # Date | Start date of the budget period in ISO 8601 date format (YYYY-MM-DD)

begin
  # Delete budget
  api_instance.delete_budget(category_id, start_date)
rescue LunchMoney::ApiError => e
  puts "Error when calling BudgetsApi->delete_budget: #{e}"
end
```

#### Using the delete_budget_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_budget_with_http_info(category_id, start_date)

```ruby
begin
  # Delete budget
  data, status_code, headers = api_instance.delete_budget_with_http_info(category_id, start_date)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue LunchMoney::ApiError => e
  puts "Error when calling BudgetsApi->delete_budget_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **category_id** | **Integer** | Category ID of the budget to delete |  |
| **start_date** | **Date** | Start date of the budget period in ISO 8601 date format (YYYY-MM-DD) |  |

### Return type

nil (empty response body)

### Authorization

[cookieAuth](../README.md#cookieAuth), [bearerSecurity](../README.md#bearerSecurity)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_budget_settings

> <BudgetSettingsResponseObject> get_budget_settings

Get budget settings

Returns the budget-related settings for the user's account.

### Examples

```ruby
require 'time'
require 'lunchmoney-sdk-ruby'
# setup authorization
LunchMoney.configure do |config|
  # Configure API key authorization: cookieAuth
  config.api_key['_lm_access_token'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['_lm_access_token'] = 'Bearer'

  # Configure Bearer authorization (JWT): bearerSecurity
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = LunchMoney::BudgetsApi.new

begin
  # Get budget settings
  result = api_instance.get_budget_settings
  p result
rescue LunchMoney::ApiError => e
  puts "Error when calling BudgetsApi->get_budget_settings: #{e}"
end
```

#### Using the get_budget_settings_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<BudgetSettingsResponseObject>, Integer, Hash)> get_budget_settings_with_http_info

```ruby
begin
  # Get budget settings
  data, status_code, headers = api_instance.get_budget_settings_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <BudgetSettingsResponseObject>
rescue LunchMoney::ApiError => e
  puts "Error when calling BudgetsApi->get_budget_settings_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**BudgetSettingsResponseObject**](BudgetSettingsResponseObject.md)

### Authorization

[cookieAuth](../README.md#cookieAuth), [bearerSecurity](../README.md#bearerSecurity)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## upsert_budget

> <BudgetUpsertResponseObject> upsert_budget(upsert_budget_request_object)

Upsert budget

Create or update a budget for a category and period.<p> If a budget already exists for the specified `start_date` and `category_id`, the `amount` (and optional `currency` and `notes`) are updated; otherwise a new budget entry is created.<p>  Note that `start_date` **must** be a valid budget period start for the account (based on the account's budget period settings). If an invalid `start_date` is provided, the request will fail with an error that indicates what the previous and next valid start dates are.<p>  Use the [budgets/settings](#tag/budgets/GET/budgets/settings) endpoint to view the account's budget settings.<br> To view existing budgets details use the [summary](#tag/summary) endpoint.

### Examples

```ruby
require 'time'
require 'lunchmoney-sdk-ruby'
# setup authorization
LunchMoney.configure do |config|
  # Configure API key authorization: cookieAuth
  config.api_key['_lm_access_token'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['_lm_access_token'] = 'Bearer'

  # Configure Bearer authorization (JWT): bearerSecurity
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = LunchMoney::BudgetsApi.new
upsert_budget_request_object = LunchMoney::UpsertBudgetRequestObject.new({start_date: Date.today, category_id: 37, amount: nil}) # UpsertBudgetRequestObject | 

begin
  # Upsert budget
  result = api_instance.upsert_budget(upsert_budget_request_object)
  p result
rescue LunchMoney::ApiError => e
  puts "Error when calling BudgetsApi->upsert_budget: #{e}"
end
```

#### Using the upsert_budget_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<BudgetUpsertResponseObject>, Integer, Hash)> upsert_budget_with_http_info(upsert_budget_request_object)

```ruby
begin
  # Upsert budget
  data, status_code, headers = api_instance.upsert_budget_with_http_info(upsert_budget_request_object)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <BudgetUpsertResponseObject>
rescue LunchMoney::ApiError => e
  puts "Error when calling BudgetsApi->upsert_budget_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **upsert_budget_request_object** | [**UpsertBudgetRequestObject**](UpsertBudgetRequestObject.md) |  |  |

### Return type

[**BudgetUpsertResponseObject**](BudgetUpsertResponseObject.md)

### Authorization

[cookieAuth](../README.md#cookieAuth), [bearerSecurity](../README.md#bearerSecurity)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

