# LunchMoney::TransactionsBulkApi

All URIs are relative to *https://api.lunchmoney.dev/v2*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**create_new_transactions**](TransactionsBulkApi.md#create_new_transactions) | **POST** /transactions | Insert one or more transactions. |
| [**delete_transactions**](TransactionsBulkApi.md#delete_transactions) | **DELETE** /transactions | Bulk delete existing transactions |
| [**get_all_transactions**](TransactionsBulkApi.md#get_all_transactions) | **GET** /transactions | Get all transactions |
| [**update_transactions**](TransactionsBulkApi.md#update_transactions) | **PUT** /transactions | Update multiple transactions |


## create_new_transactions

> <InsertTransactionsResponseObject> create_new_transactions(create_new_transactions_request)

Insert one or more transactions.

Use this endpoint to add transactions to a budget.<p> The request body for this endpoint must include a list of transactions with at least one transaction and not more than 500 transactions to insert.<p> The successful request to this endpoint will return a response body which will include two arrays:<br>  - `transactions`: A list of transactions that were successfully inserted.<br> - `skipped_duplicates`: A list of transactions that were duplicates of existing transactions and were not inserted.

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

api_instance = LunchMoney::TransactionsBulkApi.new
create_new_transactions_request = LunchMoney::CreateNewTransactionsRequest.new({transactions: [LunchMoney::InsertTransactionObject.new({date: Date.today, amount: nil})]}) # CreateNewTransactionsRequest | 

begin
  # Insert one or more transactions.
  result = api_instance.create_new_transactions(create_new_transactions_request)
  p result
rescue LunchMoney::ApiError => e
  puts "Error when calling TransactionsBulkApi->create_new_transactions: #{e}"
end
```

#### Using the create_new_transactions_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<InsertTransactionsResponseObject>, Integer, Hash)> create_new_transactions_with_http_info(create_new_transactions_request)

```ruby
begin
  # Insert one or more transactions.
  data, status_code, headers = api_instance.create_new_transactions_with_http_info(create_new_transactions_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <InsertTransactionsResponseObject>
rescue LunchMoney::ApiError => e
  puts "Error when calling TransactionsBulkApi->create_new_transactions_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **create_new_transactions_request** | [**CreateNewTransactionsRequest**](CreateNewTransactionsRequest.md) |  |  |

### Return type

[**InsertTransactionsResponseObject**](InsertTransactionsResponseObject.md)

### Authorization

[cookieAuth](../README.md#cookieAuth), [bearerSecurity](../README.md#bearerSecurity)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## delete_transactions

> delete_transactions(delete_transactions_request)

Bulk delete existing transactions

Deletes the transaction with the IDs specified in the request body.<p> If any of the specified transactions are a split transaction or a split parent, or if any are a grouped transactions or part of a transaction group, the request will fail with a suggestion on how to unsplit or ungroup the transaction(s) prior to deletion. This will also fail if any of the specified transaction IDs do not exist.<p> Otherwise, the specified transactions are deleted.<p> <span class=\"red-text\"><strong>Use with caution. This action is not reversible!</strong></span>

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

api_instance = LunchMoney::TransactionsBulkApi.new
delete_transactions_request = LunchMoney::DeleteTransactionsRequest.new({ids: [3.56]}) # DeleteTransactionsRequest | 

begin
  # Bulk delete existing transactions
  api_instance.delete_transactions(delete_transactions_request)
rescue LunchMoney::ApiError => e
  puts "Error when calling TransactionsBulkApi->delete_transactions: #{e}"
end
```

#### Using the delete_transactions_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_transactions_with_http_info(delete_transactions_request)

```ruby
begin
  # Bulk delete existing transactions
  data, status_code, headers = api_instance.delete_transactions_with_http_info(delete_transactions_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue LunchMoney::ApiError => e
  puts "Error when calling TransactionsBulkApi->delete_transactions_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **delete_transactions_request** | [**DeleteTransactionsRequest**](DeleteTransactionsRequest.md) |  |  |

### Return type

nil (empty response body)

### Authorization

[cookieAuth](../README.md#cookieAuth), [bearerSecurity](../README.md#bearerSecurity)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## get_all_transactions

> <GetAllTransactions200Response> get_all_transactions(opts)

Get all transactions

Retrieve a list of all transactions associated with a user's account. <br>If called with no parameters, this endpoint will return the most recent transactions up to `limit` number of transactions.

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

api_instance = LunchMoney::TransactionsBulkApi.new
opts = {
  start_date: Date.parse('2013-10-20'), # Date | Denotes the beginning of the time period to fetch transactions for. If omitted, the most recent transactions will be returned. See `limit`. Required if end_date exists. <br>
  end_date: Date.parse('2013-10-20'), # Date | Denotes the end of the time period you'd like to get transactions for. Required if start_date exists. 
  created_since: nil, # GetAllTransactionsCreatedSinceParameter | Filter transactions to those created after the specified timestamp. Accepts either a date (YYYY-MM-DD) or ISO 8601 datetime string. Date-only values are interpreted as midnight UTC (00:00:00Z).
  updated_since: nil, # GetAllTransactionsCreatedSinceParameter | Filter transactions to those updated after the specified timestamp. Accepts either a date (YYYY-MM-DD) or ISO 8601 datetime string. Date-only values are interpreted as midnight UTC (00:00:00Z).
  manual_account_id: 219909, # Integer | Filter transactions to those associated with specified manual account ID or set this to 0 to omit any transactions from manual accounts. Setting both this and `plaid_account_id` to 0 will return transactions with no account. These are listed as \"Cash Transactions\" in the Lunch Money GUI.<br> Note that transaction groups are not associated with any account. If you want the response to include transactions from transaction groups, set the `include_group_children` query parameter to `true` when filtering by manual accounts.
  plaid_account_id: 119807, # Integer | Filter transactions to those associated with specified plaid account ID or set this to 0 to omit any transactions from plaid accounts. Setting both this and `manual_account_id` to 0 will return transactions with no account. These are listed as \"Cash Transactions\" in the Lunch Money GUI.<br> Note that transaction groups are not associated with any account. If you want the response to include transactions from transaction groups, set the `include_group_children` query parameter to `true` when filtering by plaid accounts.
  recurring_id: 994069, # Integer | Filter transactions to those associated with specified Recurring  Item ID 
  category_id: 83, # Integer | Filter transactions to those associated with the specified category ID. Will also match category groups.  Set this to 0 to return only un-categorized transactions
  tag_id: 56, # Integer | Filter transactions to those that have a tag with the specified Tag ID
  is_group_parent: true, # Boolean | Filter by group (returns only transaction groups if `true`)
  status: 'reviewed', # String | Filter transactions to those with the specified status:<br> - `reviewed`: Only user reviewed transactions or those that were automatically marked as reviewed due to reviewed recurring_item logic<br> - `unreviewed`: Only transactions that need to be reviewed<br> - `delete_pending`: Only transactions that require manual intervention because the plaid account deleted this transaction after it was updated by the user.
  is_pending: true, # Boolean | Filter transactions by pending status. Set to `true` to return only pending transactions, or `false` to return only non-pending transactions. When this parameter is set, it takes precedence over `include_pending`. Note: Pending transactions always have a status of `unreviewed`, so when setting this parameter to `true`, either omit the `status` parameter or set it to `unreviewed`. 
  include_pending: true, # Boolean | By default, pending transactions are excluded from results. Set to `true` to include imported transactions with a pending status in the results. This query param is ignored if the `is_pending` query param is also set. 
  include_metadata: true, # Boolean | By default, custom and plaid metadata are not included in the response.  Set to true if you'd like the returned transactions objects to include any  metadata associated with the transactions.
  include_split_parents: true, # Boolean | By default, transactions that were split into multiple transactions are not included in the response. Set to true if you'd like the returned transactions objects to include any  transactions that were split into multiple transactions.  Use with caution as this data is normally not exposed after the split transactions are created.
  include_group_children: true, # Boolean | By default, individual transactions that joined into a transaction group are not included in the response. Set to true if you'd like the returned transactions objects to include any transactions that joined into a transaction group.
  include_children: true, # Boolean | By default, the `children` property is not included in the response. Set to true if you'd like the children property to be populated with the transactions that  make up a transaction group, or, if the `include_split_parents` query param is also set,  the transactions that were split from a parent transaction.
  include_files: true, # Boolean | By default, the `files` property is not included in the response. Set to true if you'd like the responses to include a list of of  objects that describe any files attached to the transactions.
  limit: 56, # Integer | Sets the maximum number of transactions to return. If more match the filter criteria, the response will include a `has_more` attribute set to `true`. See [Pagination](https://alpha.lunchmoney.dev/v2/pagination)
  offset: 56 # Integer | Sets the offset for the records returned. This is typically set automatically in the header. See [Pagination](https://alpha.lunchmoney.dev/v2/pagination)
}

begin
  # Get all transactions
  result = api_instance.get_all_transactions(opts)
  p result
rescue LunchMoney::ApiError => e
  puts "Error when calling TransactionsBulkApi->get_all_transactions: #{e}"
end
```

#### Using the get_all_transactions_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetAllTransactions200Response>, Integer, Hash)> get_all_transactions_with_http_info(opts)

```ruby
begin
  # Get all transactions
  data, status_code, headers = api_instance.get_all_transactions_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetAllTransactions200Response>
rescue LunchMoney::ApiError => e
  puts "Error when calling TransactionsBulkApi->get_all_transactions_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **start_date** | **Date** | Denotes the beginning of the time period to fetch transactions for. If omitted, the most recent transactions will be returned. See &#x60;limit&#x60;. Required if end_date exists. &lt;br&gt; | [optional] |
| **end_date** | **Date** | Denotes the end of the time period you&#39;d like to get transactions for. Required if start_date exists.  | [optional] |
| **created_since** | [**GetAllTransactionsCreatedSinceParameter**](.md) | Filter transactions to those created after the specified timestamp. Accepts either a date (YYYY-MM-DD) or ISO 8601 datetime string. Date-only values are interpreted as midnight UTC (00:00:00Z). | [optional] |
| **updated_since** | [**GetAllTransactionsCreatedSinceParameter**](.md) | Filter transactions to those updated after the specified timestamp. Accepts either a date (YYYY-MM-DD) or ISO 8601 datetime string. Date-only values are interpreted as midnight UTC (00:00:00Z). | [optional] |
| **manual_account_id** | **Integer** | Filter transactions to those associated with specified manual account ID or set this to 0 to omit any transactions from manual accounts. Setting both this and &#x60;plaid_account_id&#x60; to 0 will return transactions with no account. These are listed as \&quot;Cash Transactions\&quot; in the Lunch Money GUI.&lt;br&gt; Note that transaction groups are not associated with any account. If you want the response to include transactions from transaction groups, set the &#x60;include_group_children&#x60; query parameter to &#x60;true&#x60; when filtering by manual accounts. | [optional] |
| **plaid_account_id** | **Integer** | Filter transactions to those associated with specified plaid account ID or set this to 0 to omit any transactions from plaid accounts. Setting both this and &#x60;manual_account_id&#x60; to 0 will return transactions with no account. These are listed as \&quot;Cash Transactions\&quot; in the Lunch Money GUI.&lt;br&gt; Note that transaction groups are not associated with any account. If you want the response to include transactions from transaction groups, set the &#x60;include_group_children&#x60; query parameter to &#x60;true&#x60; when filtering by plaid accounts. | [optional] |
| **recurring_id** | **Integer** | Filter transactions to those associated with specified Recurring  Item ID  | [optional] |
| **category_id** | **Integer** | Filter transactions to those associated with the specified category ID. Will also match category groups.  Set this to 0 to return only un-categorized transactions | [optional] |
| **tag_id** | **Integer** | Filter transactions to those that have a tag with the specified Tag ID | [optional] |
| **is_group_parent** | **Boolean** | Filter by group (returns only transaction groups if &#x60;true&#x60;) | [optional] |
| **status** | **String** | Filter transactions to those with the specified status:&lt;br&gt; - &#x60;reviewed&#x60;: Only user reviewed transactions or those that were automatically marked as reviewed due to reviewed recurring_item logic&lt;br&gt; - &#x60;unreviewed&#x60;: Only transactions that need to be reviewed&lt;br&gt; - &#x60;delete_pending&#x60;: Only transactions that require manual intervention because the plaid account deleted this transaction after it was updated by the user. | [optional] |
| **is_pending** | **Boolean** | Filter transactions by pending status. Set to &#x60;true&#x60; to return only pending transactions, or &#x60;false&#x60; to return only non-pending transactions. When this parameter is set, it takes precedence over &#x60;include_pending&#x60;. Note: Pending transactions always have a status of &#x60;unreviewed&#x60;, so when setting this parameter to &#x60;true&#x60;, either omit the &#x60;status&#x60; parameter or set it to &#x60;unreviewed&#x60;.  | [optional] |
| **include_pending** | **Boolean** | By default, pending transactions are excluded from results. Set to &#x60;true&#x60; to include imported transactions with a pending status in the results. This query param is ignored if the &#x60;is_pending&#x60; query param is also set.  | [optional][default to false] |
| **include_metadata** | **Boolean** | By default, custom and plaid metadata are not included in the response.  Set to true if you&#39;d like the returned transactions objects to include any  metadata associated with the transactions. | [optional][default to false] |
| **include_split_parents** | **Boolean** | By default, transactions that were split into multiple transactions are not included in the response. Set to true if you&#39;d like the returned transactions objects to include any  transactions that were split into multiple transactions.  Use with caution as this data is normally not exposed after the split transactions are created. | [optional][default to false] |
| **include_group_children** | **Boolean** | By default, individual transactions that joined into a transaction group are not included in the response. Set to true if you&#39;d like the returned transactions objects to include any transactions that joined into a transaction group. | [optional][default to false] |
| **include_children** | **Boolean** | By default, the &#x60;children&#x60; property is not included in the response. Set to true if you&#39;d like the children property to be populated with the transactions that  make up a transaction group, or, if the &#x60;include_split_parents&#x60; query param is also set,  the transactions that were split from a parent transaction. | [optional][default to false] |
| **include_files** | **Boolean** | By default, the &#x60;files&#x60; property is not included in the response. Set to true if you&#39;d like the responses to include a list of of  objects that describe any files attached to the transactions. | [optional][default to false] |
| **limit** | **Integer** | Sets the maximum number of transactions to return. If more match the filter criteria, the response will include a &#x60;has_more&#x60; attribute set to &#x60;true&#x60;. See [Pagination](https://alpha.lunchmoney.dev/v2/pagination) | [optional][default to 1000] |
| **offset** | **Integer** | Sets the offset for the records returned. This is typically set automatically in the header. See [Pagination](https://alpha.lunchmoney.dev/v2/pagination) | [optional] |

### Return type

[**GetAllTransactions200Response**](GetAllTransactions200Response.md)

### Authorization

[cookieAuth](../README.md#cookieAuth), [bearerSecurity](../README.md#bearerSecurity)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## update_transactions

> <UpdateTransactions200Response> update_transactions(update_transactions_request)

Update multiple transactions

Modifies the properties of multiple existing transactions in a single request.<br><br> You may submit complete transaction objects from the response returned by a `GET /transactions` in the request body for each transaction, however only certain properties can be updated using this API. The following system set properties are accepted in the request body, but their values will be ignored: `id`, `to_base`, `is_pending`, `created_at`, `updated_at`, `source`, and `plaid_metadata`.<br><br> Transactions that have been previously split or grouped may not be modified by this endpoint. Therefore the `is_split_parent`, `split_parent_id`, `is_group_parent`, `group_parent_id`, and `children` properties are also ignored when provided in the request body.<br><br> Each transaction in the array **must** include an `id` property to identify which transaction to update, along with at least one other property to be updated. For example, a transaction object that contains only an `id` and `category_id` property is valid.<br><br> The request can include between 1 and 500 transactions to update in a single call.

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

api_instance = LunchMoney::TransactionsBulkApi.new
update_transactions_request = LunchMoney::UpdateTransactionsRequest.new({transactions: [LunchMoney::UpdateTransactionsRequestTransactionsInner.new({id: 3.56})]}) # UpdateTransactionsRequest | 

begin
  # Update multiple transactions
  result = api_instance.update_transactions(update_transactions_request)
  p result
rescue LunchMoney::ApiError => e
  puts "Error when calling TransactionsBulkApi->update_transactions: #{e}"
end
```

#### Using the update_transactions_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<UpdateTransactions200Response>, Integer, Hash)> update_transactions_with_http_info(update_transactions_request)

```ruby
begin
  # Update multiple transactions
  data, status_code, headers = api_instance.update_transactions_with_http_info(update_transactions_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <UpdateTransactions200Response>
rescue LunchMoney::ApiError => e
  puts "Error when calling TransactionsBulkApi->update_transactions_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **update_transactions_request** | [**UpdateTransactionsRequest**](UpdateTransactionsRequest.md) |  |  |

### Return type

[**UpdateTransactions200Response**](UpdateTransactions200Response.md)

### Authorization

[cookieAuth](../README.md#cookieAuth), [bearerSecurity](../README.md#bearerSecurity)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

