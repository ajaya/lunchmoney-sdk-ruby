# LunchMoney::PlaidAccountsApi

All URIs are relative to *https://api.lunchmoney.dev/v2*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**get_all_plaid_accounts**](PlaidAccountsApi.md#get_all_plaid_accounts) | **GET** /plaid_accounts | Get all accounts synced via Plaid |
| [**get_plaid_account_by_id**](PlaidAccountsApi.md#get_plaid_account_by_id) | **GET** /plaid_accounts/{id} | Get a single account that is synced via Plaid |
| [**trigger_plaid_account_fetch**](PlaidAccountsApi.md#trigger_plaid_account_fetch) | **POST** /plaid_accounts/fetch | Trigger Fetch from Plaid |


## get_all_plaid_accounts

> <GetAllPlaidAccounts200Response> get_all_plaid_accounts

Get all accounts synced via Plaid

Retrieve a list of all synced accounts associated with the user's account.

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

api_instance = LunchMoney::PlaidAccountsApi.new

begin
  # Get all accounts synced via Plaid
  result = api_instance.get_all_plaid_accounts
  p result
rescue LunchMoney::ApiError => e
  puts "Error when calling PlaidAccountsApi->get_all_plaid_accounts: #{e}"
end
```

#### Using the get_all_plaid_accounts_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetAllPlaidAccounts200Response>, Integer, Hash)> get_all_plaid_accounts_with_http_info

```ruby
begin
  # Get all accounts synced via Plaid
  data, status_code, headers = api_instance.get_all_plaid_accounts_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetAllPlaidAccounts200Response>
rescue LunchMoney::ApiError => e
  puts "Error when calling PlaidAccountsApi->get_all_plaid_accounts_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**GetAllPlaidAccounts200Response**](GetAllPlaidAccounts200Response.md)

### Authorization

[cookieAuth](../README.md#cookieAuth), [bearerSecurity](../README.md#bearerSecurity)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_plaid_account_by_id

> <PlaidAccountObject> get_plaid_account_by_id(id)

Get a single account that is synced via Plaid

Retrieve the details of the plaid account with the specified ID.

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

api_instance = LunchMoney::PlaidAccountsApi.new
id = 119805 # Integer | ID of the plaid account to retrieve

begin
  # Get a single account that is synced via Plaid
  result = api_instance.get_plaid_account_by_id(id)
  p result
rescue LunchMoney::ApiError => e
  puts "Error when calling PlaidAccountsApi->get_plaid_account_by_id: #{e}"
end
```

#### Using the get_plaid_account_by_id_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<PlaidAccountObject>, Integer, Hash)> get_plaid_account_by_id_with_http_info(id)

```ruby
begin
  # Get a single account that is synced via Plaid
  data, status_code, headers = api_instance.get_plaid_account_by_id_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <PlaidAccountObject>
rescue LunchMoney::ApiError => e
  puts "Error when calling PlaidAccountsApi->get_plaid_account_by_id_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | ID of the plaid account to retrieve |  |

### Return type

[**PlaidAccountObject**](PlaidAccountObject.md)

### Authorization

[cookieAuth](../README.md#cookieAuth), [bearerSecurity](../README.md#bearerSecurity)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## trigger_plaid_account_fetch

> trigger_plaid_account_fetch(opts)

Trigger Fetch from Plaid

Use this endpoint to trigger a fetch for latest data from Plaid.<br><br> Eligible accounts are those who last_fetch value is over 1 minute ago. (Although the limit is every minute, please use this endpoint sparingly!) Successive calls to this endpoint under a minute after the first will return a 425 TOO EARLY response.<br><br> Successful calls will return a 202 ACCEPTED response. Note that fetching from Plaid is a background job. This endpoint simply queues up the job. You may track the `plaid_last_successful_update`, `last_fetch` and `last_import` properties to verify the results of the fetch. The `last fetch` property is updated when Plaid accepts a request to fetch data. The `plaid_last_successful_update`is updated when it successfully contacts the associated financial institution. The `last_import` field is updated only when new transactions have been imported.

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

api_instance = LunchMoney::PlaidAccountsApi.new
opts = {
  start_date: Date.parse('2013-10-20'), # Date | Denotes the beginning of the time period to fetch transactions for. If omitted, the most recent transactions will be returned. <br> Required if end_date exists. <br>
  end_date: Date.parse('2013-10-20'), # Date | Denotes the end of the time period you'd like to get transactions for. Required if start_date exists. 
  id: 119807 # Integer | Specific ID of a plaid account to fetch. If not set the endpoint will trigger a fetch for all eligible accounts.
}

begin
  # Trigger Fetch from Plaid
  api_instance.trigger_plaid_account_fetch(opts)
rescue LunchMoney::ApiError => e
  puts "Error when calling PlaidAccountsApi->trigger_plaid_account_fetch: #{e}"
end
```

#### Using the trigger_plaid_account_fetch_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> trigger_plaid_account_fetch_with_http_info(opts)

```ruby
begin
  # Trigger Fetch from Plaid
  data, status_code, headers = api_instance.trigger_plaid_account_fetch_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue LunchMoney::ApiError => e
  puts "Error when calling PlaidAccountsApi->trigger_plaid_account_fetch_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **start_date** | **Date** | Denotes the beginning of the time period to fetch transactions for. If omitted, the most recent transactions will be returned. &lt;br&gt; Required if end_date exists. &lt;br&gt; | [optional] |
| **end_date** | **Date** | Denotes the end of the time period you&#39;d like to get transactions for. Required if start_date exists.  | [optional] |
| **id** | **Integer** | Specific ID of a plaid account to fetch. If not set the endpoint will trigger a fetch for all eligible accounts. | [optional] |

### Return type

nil (empty response body)

### Authorization

[cookieAuth](../README.md#cookieAuth), [bearerSecurity](../README.md#bearerSecurity)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

