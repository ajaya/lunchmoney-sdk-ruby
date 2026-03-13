# LunchMoney::TransactionsApi

All URIs are relative to *https://api.lunchmoney.dev/v2*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**delete_transaction_by_id**](TransactionsApi.md#delete_transaction_by_id) | **DELETE** /transactions/{id} | Delete a transaction |
| [**get_transaction_by_id**](TransactionsApi.md#get_transaction_by_id) | **GET** /transactions/{id} | Get a single transaction |
| [**update_transaction**](TransactionsApi.md#update_transaction) | **PUT** /transactions/{id} | Update an existing transaction |


## delete_transaction_by_id

> delete_transaction_by_id(id)

Delete a transaction

Deletes the transaction with the ID specified on the path.<p> If the specified transaction is a split transaction or a split parent, or if it is a grouped transactions or part of a transaction group, the request will fail with a suggestion on how to unsplit or ungroup the transaction(s) prior to deletion. Otherwise, the specified transaction is deleted. <p> <span class=\"red-text\"><strong>Use with caution. This action is not reversible!</strong></span>

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

api_instance = LunchMoney::TransactionsApi.new
id = 2112140361 # Integer | ID of the transaction to delete

begin
  # Delete a transaction
  api_instance.delete_transaction_by_id(id)
rescue LunchMoney::ApiError => e
  puts "Error when calling TransactionsApi->delete_transaction_by_id: #{e}"
end
```

#### Using the delete_transaction_by_id_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_transaction_by_id_with_http_info(id)

```ruby
begin
  # Delete a transaction
  data, status_code, headers = api_instance.delete_transaction_by_id_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue LunchMoney::ApiError => e
  puts "Error when calling TransactionsApi->delete_transaction_by_id_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | ID of the transaction to delete |  |

### Return type

nil (empty response body)

### Authorization

[cookieAuth](../README.md#cookieAuth), [bearerSecurity](../README.md#bearerSecurity)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_transaction_by_id

> <TransactionObject> get_transaction_by_id(id)

Get a single transaction

Retrieves the details of a specific transaction by its ID, including the following properties which are not returned by default in the response to a `GET /transactions` request:<br>  - `plaid_metadata` will either be `null` or contain the metadata for transactions associated with an account that is synced via plaid.  - `custom_metadata` will either be `null` or contain any custom_metadata added to transactions that were inserted or updated via the API. - `files` will be a list of objects that describe any attachments to the transaction.  If `is_group_parent` is true in the returned transaction, the object will also include the `children` property which will contain a list of the  original transactions that make up the transaction group.<br> If `is_split_parent` is true in the returned transaction, the object will also include the `children` property which will contain a list of the split transactions. 

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

api_instance = LunchMoney::TransactionsApi.new
id = 2112150654 # Integer | ID of the transaction to retrieve

begin
  # Get a single transaction
  result = api_instance.get_transaction_by_id(id)
  p result
rescue LunchMoney::ApiError => e
  puts "Error when calling TransactionsApi->get_transaction_by_id: #{e}"
end
```

#### Using the get_transaction_by_id_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<TransactionObject>, Integer, Hash)> get_transaction_by_id_with_http_info(id)

```ruby
begin
  # Get a single transaction
  data, status_code, headers = api_instance.get_transaction_by_id_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <TransactionObject>
rescue LunchMoney::ApiError => e
  puts "Error when calling TransactionsApi->get_transaction_by_id_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | ID of the transaction to retrieve |  |

### Return type

[**TransactionObject**](TransactionObject.md)

### Authorization

[cookieAuth](../README.md#cookieAuth), [bearerSecurity](../README.md#bearerSecurity)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## update_transaction

> <TransactionObject> update_transaction(id, update_transaction_object, opts)

Update an existing transaction

Modifies the properties of an existing transaction.<br><br> You may submit the response from a `GET /transactions/{id}` as the request body, however only certain properties can be updated using this API. The following system set properties are accepted in the request body but their values will be ignored: `id`, `to_base`, `is_pending`, `created_at`, `updated_at`, `source`, and `plaid_metadata`.<br><br> Transactions that have been previously split or grouped may not be modified by this endpoint. Therefore the `is_split_parent`, `split_parent_id`, `is_group_parent`, `group_parent_id`, and `children` properties are also ignored when provided in the request body.<br><br> It is also possible to provide only the properties to be updated in the request body, as long as the request includes at least one of the properties that is not listed above. For example a request body that contains only an `category_id` attribute is valid.

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

api_instance = LunchMoney::TransactionsApi.new
id = 2112140361 # Integer | ID of the transaction to update
update_transaction_object = LunchMoney::UpdateTransactionObject.new # UpdateTransactionObject | 
opts = {
  update_balance: true # Boolean | Set this to `false` to skip updating the transaction's associated account balance. Default behavior is to update balances.
}

begin
  # Update an existing transaction
  result = api_instance.update_transaction(id, update_transaction_object, opts)
  p result
rescue LunchMoney::ApiError => e
  puts "Error when calling TransactionsApi->update_transaction: #{e}"
end
```

#### Using the update_transaction_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<TransactionObject>, Integer, Hash)> update_transaction_with_http_info(id, update_transaction_object, opts)

```ruby
begin
  # Update an existing transaction
  data, status_code, headers = api_instance.update_transaction_with_http_info(id, update_transaction_object, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <TransactionObject>
rescue LunchMoney::ApiError => e
  puts "Error when calling TransactionsApi->update_transaction_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | ID of the transaction to update |  |
| **update_transaction_object** | [**UpdateTransactionObject**](UpdateTransactionObject.md) |  |  |
| **update_balance** | **Boolean** | Set this to &#x60;false&#x60; to skip updating the transaction&#39;s associated account balance. Default behavior is to update balances. | [optional] |

### Return type

[**TransactionObject**](TransactionObject.md)

### Authorization

[cookieAuth](../README.md#cookieAuth), [bearerSecurity](../README.md#bearerSecurity)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

