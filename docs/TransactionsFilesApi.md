# LunchMoney::TransactionsFilesApi

All URIs are relative to *https://api.lunchmoney.dev/v2*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**attach_file_to_transaction**](TransactionsFilesApi.md#attach_file_to_transaction) | **POST** /transactions/{transaction_id}/attachments | Attach a file to a transaction |
| [**delete_transaction_attachment**](TransactionsFilesApi.md#delete_transaction_attachment) | **DELETE** /transactions/attachments/{file_id} | Delete a file attachment |
| [**get_transaction_attachment_url**](TransactionsFilesApi.md#get_transaction_attachment_url) | **GET** /transactions/attachments/{file_id} | Get a url to download a file attachment |


## attach_file_to_transaction

> <TransactionAttachmentObject> attach_file_to_transaction(transaction_id, file, opts)

Attach a file to a transaction

Attaches a file to a transaction. The file must be less than 10MB in size.<br><br> The file will be attached to the transaction and can be downloaded from the link returned by a `GET /transactions/attachments/{file_id}` request.

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

api_instance = LunchMoney::TransactionsFilesApi.new
transaction_id = 2112150655 # Integer | 
file = File.new('/path/to/some/file') # File | The file to attach via multipart form encoding.  File size may not exceed 10MB. 
opts = {
  notes: 'notes_example' # String | Optional notes about the file
}

begin
  # Attach a file to a transaction
  result = api_instance.attach_file_to_transaction(transaction_id, file, opts)
  p result
rescue LunchMoney::ApiError => e
  puts "Error when calling TransactionsFilesApi->attach_file_to_transaction: #{e}"
end
```

#### Using the attach_file_to_transaction_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<TransactionAttachmentObject>, Integer, Hash)> attach_file_to_transaction_with_http_info(transaction_id, file, opts)

```ruby
begin
  # Attach a file to a transaction
  data, status_code, headers = api_instance.attach_file_to_transaction_with_http_info(transaction_id, file, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <TransactionAttachmentObject>
rescue LunchMoney::ApiError => e
  puts "Error when calling TransactionsFilesApi->attach_file_to_transaction_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **transaction_id** | **Integer** |  |  |
| **file** | **File** | The file to attach via multipart form encoding.  File size may not exceed 10MB.  |  |
| **notes** | **String** | Optional notes about the file | [optional] |

### Return type

[**TransactionAttachmentObject**](TransactionAttachmentObject.md)

### Authorization

[cookieAuth](../README.md#cookieAuth), [bearerSecurity](../README.md#bearerSecurity)

### HTTP request headers

- **Content-Type**: multipart/form-data
- **Accept**: application/json


## delete_transaction_attachment

> delete_transaction_attachment(file_id)

Delete a file attachment

Deletes a file attachment from a transaction.

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

api_instance = LunchMoney::TransactionsFilesApi.new
file_id = 1234567890 # Integer | 

begin
  # Delete a file attachment
  api_instance.delete_transaction_attachment(file_id)
rescue LunchMoney::ApiError => e
  puts "Error when calling TransactionsFilesApi->delete_transaction_attachment: #{e}"
end
```

#### Using the delete_transaction_attachment_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_transaction_attachment_with_http_info(file_id)

```ruby
begin
  # Delete a file attachment
  data, status_code, headers = api_instance.delete_transaction_attachment_with_http_info(file_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue LunchMoney::ApiError => e
  puts "Error when calling TransactionsFilesApi->delete_transaction_attachment_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **file_id** | **Integer** |  |  |

### Return type

nil (empty response body)

### Authorization

[cookieAuth](../README.md#cookieAuth), [bearerSecurity](../README.md#bearerSecurity)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_transaction_attachment_url

> <GetTransactionAttachmentUrl200Response> get_transaction_attachment_url(file_id)

Get a url to download a file attachment

Returns a signed url that can be used to download the file attachment.

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

api_instance = LunchMoney::TransactionsFilesApi.new
file_id = 1234567890 # Integer | 

begin
  # Get a url to download a file attachment
  result = api_instance.get_transaction_attachment_url(file_id)
  p result
rescue LunchMoney::ApiError => e
  puts "Error when calling TransactionsFilesApi->get_transaction_attachment_url: #{e}"
end
```

#### Using the get_transaction_attachment_url_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetTransactionAttachmentUrl200Response>, Integer, Hash)> get_transaction_attachment_url_with_http_info(file_id)

```ruby
begin
  # Get a url to download a file attachment
  data, status_code, headers = api_instance.get_transaction_attachment_url_with_http_info(file_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetTransactionAttachmentUrl200Response>
rescue LunchMoney::ApiError => e
  puts "Error when calling TransactionsFilesApi->get_transaction_attachment_url_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **file_id** | **Integer** |  |  |

### Return type

[**GetTransactionAttachmentUrl200Response**](GetTransactionAttachmentUrl200Response.md)

### Authorization

[cookieAuth](../README.md#cookieAuth), [bearerSecurity](../README.md#bearerSecurity)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

