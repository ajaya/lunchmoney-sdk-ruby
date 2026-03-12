# LunchMoney::TransactionsGroupApi

All URIs are relative to *https://api.lunchmoney.dev/v2*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**group_transactions**](TransactionsGroupApi.md#group_transactions) | **POST** /transactions/group | Create a transaction group |
| [**ungroup_transactions**](TransactionsGroupApi.md#ungroup_transactions) | **DELETE** /transactions/group/{id} | Delete a transaction group |


## group_transactions

> <TransactionObject> group_transactions(group_transactions_request)

Create a transaction group

Specify a set of existing transaction IDs to group together as a single grouped transaction.  The new transaction will have an amount equal to the sum of the grouped transaction amounts. If the  grouped transactions have different currencies, the new group transaction will be set in the user's default currency.<br><br>  After a transaction has been grouped, the original transactions are no longer shown on the  transactions page or returned by a `GET /transactions` request. The newly created grouped  transaction is returned instead.  To see the details of the original transactions that were used to create a transaction group, use the `GET /transactions/{id}` endpoint and pass the ID of the grouped transaction. The grouped transactions will be included in the `children` property of the transaction returned in the response 

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

api_instance = LunchMoney::TransactionsGroupApi.new
group_transactions_request = LunchMoney::GroupTransactionsRequest.new({ids: [3.56], date: Date.today, payee: 'payee_example'}) # GroupTransactionsRequest | 

begin
  # Create a transaction group
  result = api_instance.group_transactions(group_transactions_request)
  p result
rescue LunchMoney::ApiError => e
  puts "Error when calling TransactionsGroupApi->group_transactions: #{e}"
end
```

#### Using the group_transactions_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<TransactionObject>, Integer, Hash)> group_transactions_with_http_info(group_transactions_request)

```ruby
begin
  # Create a transaction group
  data, status_code, headers = api_instance.group_transactions_with_http_info(group_transactions_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <TransactionObject>
rescue LunchMoney::ApiError => e
  puts "Error when calling TransactionsGroupApi->group_transactions_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **group_transactions_request** | [**GroupTransactionsRequest**](GroupTransactionsRequest.md) |  |  |

### Return type

[**TransactionObject**](TransactionObject.md)

### Authorization

[cookieAuth](../README.md#cookieAuth), [bearerSecurity](../README.md#bearerSecurity)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## ungroup_transactions

> ungroup_transactions(id)

Delete a transaction group

Deletes the transaction group with the ID specified on the path.<br> The transactions within the group are not removed and will subsequently be treated as \"normal\" ungrouped transactions.

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

api_instance = LunchMoney::TransactionsGroupApi.new
id = 2112140959 # Integer | ID of the transaction group to delete

begin
  # Delete a transaction group
  api_instance.ungroup_transactions(id)
rescue LunchMoney::ApiError => e
  puts "Error when calling TransactionsGroupApi->ungroup_transactions: #{e}"
end
```

#### Using the ungroup_transactions_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> ungroup_transactions_with_http_info(id)

```ruby
begin
  # Delete a transaction group
  data, status_code, headers = api_instance.ungroup_transactions_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue LunchMoney::ApiError => e
  puts "Error when calling TransactionsGroupApi->ungroup_transactions_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | ID of the transaction group to delete |  |

### Return type

nil (empty response body)

### Authorization

[cookieAuth](../README.md#cookieAuth), [bearerSecurity](../README.md#bearerSecurity)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

