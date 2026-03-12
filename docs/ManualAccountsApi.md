# LunchMoney::ManualAccountsApi

All URIs are relative to *https://api.lunchmoney.dev/v2*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**create_manual_account**](ManualAccountsApi.md#create_manual_account) | **POST** /manual_accounts | Create a manual account |
| [**delete_manual_account**](ManualAccountsApi.md#delete_manual_account) | **DELETE** /manual_accounts/{id} | Delete a manual account |
| [**get_all_manual_accounts**](ManualAccountsApi.md#get_all_manual_accounts) | **GET** /manual_accounts | Get all manual accounts |
| [**get_manual_account_by_id**](ManualAccountsApi.md#get_manual_account_by_id) | **GET** /manual_accounts/{id} | Get a single manual account |
| [**update_manual_account**](ManualAccountsApi.md#update_manual_account) | **PUT** /manual_accounts/{id} | Update an existing manual account |


## create_manual_account

> <ManualAccountObject> create_manual_account(create_manual_account_request_object)

Create a manual account

Create a new manually-managed account.

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

api_instance = LunchMoney::ManualAccountsApi.new
create_manual_account_request_object = TODO # CreateManualAccountRequestObject | 

begin
  # Create a manual account
  result = api_instance.create_manual_account(create_manual_account_request_object)
  p result
rescue LunchMoney::ApiError => e
  puts "Error when calling ManualAccountsApi->create_manual_account: #{e}"
end
```

#### Using the create_manual_account_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ManualAccountObject>, Integer, Hash)> create_manual_account_with_http_info(create_manual_account_request_object)

```ruby
begin
  # Create a manual account
  data, status_code, headers = api_instance.create_manual_account_with_http_info(create_manual_account_request_object)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ManualAccountObject>
rescue LunchMoney::ApiError => e
  puts "Error when calling ManualAccountsApi->create_manual_account_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **create_manual_account_request_object** | [**CreateManualAccountRequestObject**](CreateManualAccountRequestObject.md) |  |  |

### Return type

[**ManualAccountObject**](ManualAccountObject.md)

### Authorization

[cookieAuth](../README.md#cookieAuth), [bearerSecurity](../README.md#bearerSecurity)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## delete_manual_account

> delete_manual_account(id, opts)

Delete a manual account

Deletes the single manual account with the ID specified on the path. If any transactions exist with the `manual_account_id` property set to this account's ID they will appear with a warning when displayed in the web view.

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

api_instance = LunchMoney::ManualAccountsApi.new
id = 119807 # Integer | ID of the manual account to delete
opts = {
  delete_items: true, # Boolean | When set to true will also delete any transactions, rules, and recurring items associated with this account. Use this option with caution, it is irreversible!
  delete_balance_history: true # Boolean | When set to true will delete any balance history associated with this account.
}

begin
  # Delete a manual account
  api_instance.delete_manual_account(id, opts)
rescue LunchMoney::ApiError => e
  puts "Error when calling ManualAccountsApi->delete_manual_account: #{e}"
end
```

#### Using the delete_manual_account_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_manual_account_with_http_info(id, opts)

```ruby
begin
  # Delete a manual account
  data, status_code, headers = api_instance.delete_manual_account_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue LunchMoney::ApiError => e
  puts "Error when calling ManualAccountsApi->delete_manual_account_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | ID of the manual account to delete |  |
| **delete_items** | **Boolean** | When set to true will also delete any transactions, rules, and recurring items associated with this account. Use this option with caution, it is irreversible! | [optional][default to false] |
| **delete_balance_history** | **Boolean** | When set to true will delete any balance history associated with this account. | [optional][default to false] |

### Return type

nil (empty response body)

### Authorization

[cookieAuth](../README.md#cookieAuth), [bearerSecurity](../README.md#bearerSecurity)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_all_manual_accounts

> <GetAllManualAccounts200Response> get_all_manual_accounts

Get all manual accounts

Retrieve a list of all manually-managed accounts associated with the user's account.

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

api_instance = LunchMoney::ManualAccountsApi.new

begin
  # Get all manual accounts
  result = api_instance.get_all_manual_accounts
  p result
rescue LunchMoney::ApiError => e
  puts "Error when calling ManualAccountsApi->get_all_manual_accounts: #{e}"
end
```

#### Using the get_all_manual_accounts_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetAllManualAccounts200Response>, Integer, Hash)> get_all_manual_accounts_with_http_info

```ruby
begin
  # Get all manual accounts
  data, status_code, headers = api_instance.get_all_manual_accounts_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetAllManualAccounts200Response>
rescue LunchMoney::ApiError => e
  puts "Error when calling ManualAccountsApi->get_all_manual_accounts_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**GetAllManualAccounts200Response**](GetAllManualAccounts200Response.md)

### Authorization

[cookieAuth](../README.md#cookieAuth), [bearerSecurity](../README.md#bearerSecurity)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_manual_account_by_id

> <ManualAccountObject> get_manual_account_by_id(id)

Get a single manual account

Retrieve the details of the manual account with the specified ID.

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

api_instance = LunchMoney::ManualAccountsApi.new
id = 119807 # Integer | ID of the manual account to retrieve

begin
  # Get a single manual account
  result = api_instance.get_manual_account_by_id(id)
  p result
rescue LunchMoney::ApiError => e
  puts "Error when calling ManualAccountsApi->get_manual_account_by_id: #{e}"
end
```

#### Using the get_manual_account_by_id_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ManualAccountObject>, Integer, Hash)> get_manual_account_by_id_with_http_info(id)

```ruby
begin
  # Get a single manual account
  data, status_code, headers = api_instance.get_manual_account_by_id_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ManualAccountObject>
rescue LunchMoney::ApiError => e
  puts "Error when calling ManualAccountsApi->get_manual_account_by_id_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | ID of the manual account to retrieve |  |

### Return type

[**ManualAccountObject**](ManualAccountObject.md)

### Authorization

[cookieAuth](../README.md#cookieAuth), [bearerSecurity](../README.md#bearerSecurity)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## update_manual_account

> <ManualAccountObject> update_manual_account(id, update_manual_account_request_object)

Update an existing manual account

Modifies the properties of an existing manual account.<br><br> You may submit the response from a `GET /manual_accounts/{id}` as the request body, however only certain properties can be updated using this API. The following system set properties are accepted in the request body but their values will be ignored: `id`, `to_base`, `created_at`, and `updated_at`.<br><br> It is also possible to provide only the properties to be updated in the request body, as long as the request includes at least one of the properties that is not listed above. For example a request body that contains only a `name` property is valid.<br><br>

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

api_instance = LunchMoney::ManualAccountsApi.new
id = 119807 # Integer | ID of the manual account to update
update_manual_account_request_object = TODO # UpdateManualAccountRequestObject | 

begin
  # Update an existing manual account
  result = api_instance.update_manual_account(id, update_manual_account_request_object)
  p result
rescue LunchMoney::ApiError => e
  puts "Error when calling ManualAccountsApi->update_manual_account: #{e}"
end
```

#### Using the update_manual_account_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ManualAccountObject>, Integer, Hash)> update_manual_account_with_http_info(id, update_manual_account_request_object)

```ruby
begin
  # Update an existing manual account
  data, status_code, headers = api_instance.update_manual_account_with_http_info(id, update_manual_account_request_object)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ManualAccountObject>
rescue LunchMoney::ApiError => e
  puts "Error when calling ManualAccountsApi->update_manual_account_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | ID of the manual account to update |  |
| **update_manual_account_request_object** | [**UpdateManualAccountRequestObject**](UpdateManualAccountRequestObject.md) |  |  |

### Return type

[**ManualAccountObject**](ManualAccountObject.md)

### Authorization

[cookieAuth](../README.md#cookieAuth), [bearerSecurity](../README.md#bearerSecurity)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

