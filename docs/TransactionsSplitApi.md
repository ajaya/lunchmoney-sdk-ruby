# LunchMoney::TransactionsSplitApi

All URIs are relative to *https://api.lunchmoney.dev/v2*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**split_transaction**](TransactionsSplitApi.md#split_transaction) | **POST** /transactions/split/{id} | Split a transaction |
| [**unsplit_transaction**](TransactionsSplitApi.md#unsplit_transaction) | **DELETE** /transactions/split/{id} | Unsplit a previously split transactions |


## split_transaction

> <TransactionObject> split_transaction(id, split_transaction_request)

Split a transaction

Splits an existing transaction into a set of smaller child transactions.<br><br> After a transaction has been split, the original transaction is no longer shown on the transactions page or returned by a `GET /transactions` request. The newly created child transactions are returned instead. To see the details of the original parent transaction after it has been split, use the `GET /transactions/{id}` endpoint and pass the value of the `split_parent_id` of one of the children.

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

api_instance = LunchMoney::TransactionsSplitApi.new
id = 2112150650 # Integer | ID of the transaction to spit
split_transaction_request = LunchMoney::SplitTransactionRequest.new({child_transactions: [LunchMoney::SplitTransactionObject.new({amount: nil})]}) # SplitTransactionRequest | 

begin
  # Split a transaction
  result = api_instance.split_transaction(id, split_transaction_request)
  p result
rescue LunchMoney::ApiError => e
  puts "Error when calling TransactionsSplitApi->split_transaction: #{e}"
end
```

#### Using the split_transaction_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<TransactionObject>, Integer, Hash)> split_transaction_with_http_info(id, split_transaction_request)

```ruby
begin
  # Split a transaction
  data, status_code, headers = api_instance.split_transaction_with_http_info(id, split_transaction_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <TransactionObject>
rescue LunchMoney::ApiError => e
  puts "Error when calling TransactionsSplitApi->split_transaction_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | ID of the transaction to spit |  |
| **split_transaction_request** | [**SplitTransactionRequest**](SplitTransactionRequest.md) |  |  |

### Return type

[**TransactionObject**](TransactionObject.md)

### Authorization

[cookieAuth](../README.md#cookieAuth), [bearerSecurity](../README.md#bearerSecurity)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## unsplit_transaction

> unsplit_transaction(id)

Unsplit a previously split transactions

Deletes the split children of a previously split transactions and restores the parent transactions to the normal unsplit state.<br><br> Use the value of the `split_parent_id`property of a split transaction to specify the parent ID.

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

api_instance = LunchMoney::TransactionsSplitApi.new
id = 2112140459 # Integer | ID of the previously split transaction to delete.

begin
  # Unsplit a previously split transactions
  api_instance.unsplit_transaction(id)
rescue LunchMoney::ApiError => e
  puts "Error when calling TransactionsSplitApi->unsplit_transaction: #{e}"
end
```

#### Using the unsplit_transaction_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> unsplit_transaction_with_http_info(id)

```ruby
begin
  # Unsplit a previously split transactions
  data, status_code, headers = api_instance.unsplit_transaction_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue LunchMoney::ApiError => e
  puts "Error when calling TransactionsSplitApi->unsplit_transaction_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | ID of the previously split transaction to delete. |  |

### Return type

nil (empty response body)

### Authorization

[cookieAuth](../README.md#cookieAuth), [bearerSecurity](../README.md#bearerSecurity)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

