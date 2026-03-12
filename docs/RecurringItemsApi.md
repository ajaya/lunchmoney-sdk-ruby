# LunchMoney::RecurringItemsApi

All URIs are relative to *https://api.lunchmoney.dev/v2*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**get_all_recurring**](RecurringItemsApi.md#get_all_recurring) | **GET** /recurring_items | Get all recurring items |
| [**get_recurring_by_id**](RecurringItemsApi.md#get_recurring_by_id) | **GET** /recurring_items/{id} | Get a single recurring item |


## get_all_recurring

> <GetAllRecurring200Response> get_all_recurring(opts)

Get all recurring items

Get info about the recurring items for a specified time frame

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

api_instance = LunchMoney::RecurringItemsApi.new
opts = {
  start_date: Date.parse('2013-10-20'), # Date | Denotes the beginning of the range used to populate the `matching` object in the recurring items. If omitted, the current month will be used as the range.<br> Required if end_date exists.
  end_date: Date.parse('2013-10-20'), # Date | Denotes the end of the range used to populate the `matching` object in the recurring items. Required if start_date exists. 
  include_suggested: true # Boolean | 
}

begin
  # Get all recurring items
  result = api_instance.get_all_recurring(opts)
  p result
rescue LunchMoney::ApiError => e
  puts "Error when calling RecurringItemsApi->get_all_recurring: #{e}"
end
```

#### Using the get_all_recurring_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetAllRecurring200Response>, Integer, Hash)> get_all_recurring_with_http_info(opts)

```ruby
begin
  # Get all recurring items
  data, status_code, headers = api_instance.get_all_recurring_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetAllRecurring200Response>
rescue LunchMoney::ApiError => e
  puts "Error when calling RecurringItemsApi->get_all_recurring_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **start_date** | **Date** | Denotes the beginning of the range used to populate the &#x60;matching&#x60; object in the recurring items. If omitted, the current month will be used as the range.&lt;br&gt; Required if end_date exists. | [optional] |
| **end_date** | **Date** | Denotes the end of the range used to populate the &#x60;matching&#x60; object in the recurring items. Required if start_date exists.  | [optional] |
| **include_suggested** | **Boolean** |  | [optional] |

### Return type

[**GetAllRecurring200Response**](GetAllRecurring200Response.md)

### Authorization

[cookieAuth](../README.md#cookieAuth), [bearerSecurity](../README.md#bearerSecurity)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_recurring_by_id

> <RecurringObject> get_recurring_by_id(id, opts)

Get a single recurring item

Retrieve the details of a specific recurring item with the specified ID.

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

api_instance = LunchMoney::RecurringItemsApi.new
id = 994069 # Integer | ID of the recurring item to retrieve
opts = {
  start_date: Date.parse('2013-10-20'), # Date | Denotes the beginning of the range used to populate the `matching` object in the recurring items. If omitted, the current month will be used as the range.<br> Required if end_date exists.
  end_date: Date.parse('2013-10-20') # Date | Denotes the end of the range used to populate the `matching` object in the recurring items. Required if start_date exists. 
}

begin
  # Get a single recurring item
  result = api_instance.get_recurring_by_id(id, opts)
  p result
rescue LunchMoney::ApiError => e
  puts "Error when calling RecurringItemsApi->get_recurring_by_id: #{e}"
end
```

#### Using the get_recurring_by_id_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<RecurringObject>, Integer, Hash)> get_recurring_by_id_with_http_info(id, opts)

```ruby
begin
  # Get a single recurring item
  data, status_code, headers = api_instance.get_recurring_by_id_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <RecurringObject>
rescue LunchMoney::ApiError => e
  puts "Error when calling RecurringItemsApi->get_recurring_by_id_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | ID of the recurring item to retrieve |  |
| **start_date** | **Date** | Denotes the beginning of the range used to populate the &#x60;matching&#x60; object in the recurring items. If omitted, the current month will be used as the range.&lt;br&gt; Required if end_date exists. | [optional] |
| **end_date** | **Date** | Denotes the end of the range used to populate the &#x60;matching&#x60; object in the recurring items. Required if start_date exists.  | [optional] |

### Return type

[**RecurringObject**](RecurringObject.md)

### Authorization

[cookieAuth](../README.md#cookieAuth), [bearerSecurity](../README.md#bearerSecurity)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

