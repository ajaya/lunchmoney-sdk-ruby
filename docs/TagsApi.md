# LunchMoney::TagsApi

All URIs are relative to *https://api.lunchmoney.dev/v2*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**create_tag**](TagsApi.md#create_tag) | **POST** /tags | Create a new tag |
| [**delete_tag**](TagsApi.md#delete_tag) | **DELETE** /tags/{id} | Delete a tag |
| [**get_all_tags**](TagsApi.md#get_all_tags) | **GET** /tags | Get All Tags |
| [**get_tag_by_id**](TagsApi.md#get_tag_by_id) | **GET** /tags/{id} | Get a single tag |
| [**update_tag**](TagsApi.md#update_tag) | **PUT** /tags/{id} | Update an existing tag |


## create_tag

> <TagObject> create_tag(create_tag_request_object)

Create a new tag

Creates a new tag with the given name

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

api_instance = LunchMoney::TagsApi.new
create_tag_request_object = TODO # CreateTagRequestObject | 

begin
  # Create a new tag
  result = api_instance.create_tag(create_tag_request_object)
  p result
rescue LunchMoney::ApiError => e
  puts "Error when calling TagsApi->create_tag: #{e}"
end
```

#### Using the create_tag_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<TagObject>, Integer, Hash)> create_tag_with_http_info(create_tag_request_object)

```ruby
begin
  # Create a new tag
  data, status_code, headers = api_instance.create_tag_with_http_info(create_tag_request_object)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <TagObject>
rescue LunchMoney::ApiError => e
  puts "Error when calling TagsApi->create_tag_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **create_tag_request_object** | [**CreateTagRequestObject**](CreateTagRequestObject.md) |  |  |

### Return type

[**TagObject**](TagObject.md)

### Authorization

[cookieAuth](../README.md#cookieAuth), [bearerSecurity](../README.md#bearerSecurity)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## delete_tag

> delete_tag(id, opts)

Delete a tag

Deletes the tag with the ID specified on the path.<br> If transaction or rules exist with the tag a dependents object is returned and the tag is not deleted. This behavior can be overridden by setting the `force` param to `true`.

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

api_instance = LunchMoney::TagsApi.new
id = 94319 # Integer | ID of the tag to delete
opts = {
  force: true # Boolean | Set to true to force deletion even if there are dependencies
}

begin
  # Delete a tag
  api_instance.delete_tag(id, opts)
rescue LunchMoney::ApiError => e
  puts "Error when calling TagsApi->delete_tag: #{e}"
end
```

#### Using the delete_tag_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_tag_with_http_info(id, opts)

```ruby
begin
  # Delete a tag
  data, status_code, headers = api_instance.delete_tag_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue LunchMoney::ApiError => e
  puts "Error when calling TagsApi->delete_tag_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | ID of the tag to delete |  |
| **force** | **Boolean** | Set to true to force deletion even if there are dependencies | [optional][default to false] |

### Return type

nil (empty response body)

### Authorization

[cookieAuth](../README.md#cookieAuth), [bearerSecurity](../README.md#bearerSecurity)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_all_tags

> <GetAllTags200Response> get_all_tags

Get All Tags

Retrieve a list of all tags associated with the user's account.

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

api_instance = LunchMoney::TagsApi.new

begin
  # Get All Tags
  result = api_instance.get_all_tags
  p result
rescue LunchMoney::ApiError => e
  puts "Error when calling TagsApi->get_all_tags: #{e}"
end
```

#### Using the get_all_tags_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetAllTags200Response>, Integer, Hash)> get_all_tags_with_http_info

```ruby
begin
  # Get All Tags
  data, status_code, headers = api_instance.get_all_tags_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetAllTags200Response>
rescue LunchMoney::ApiError => e
  puts "Error when calling TagsApi->get_all_tags_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**GetAllTags200Response**](GetAllTags200Response.md)

### Authorization

[cookieAuth](../README.md#cookieAuth), [bearerSecurity](../README.md#bearerSecurity)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_tag_by_id

> <TagObject> get_tag_by_id(id)

Get a single tag

Retrieve the details of a specific tag with the specified ID.

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

api_instance = LunchMoney::TagsApi.new
id = 94319 # Integer | ID of the tag to retrieve

begin
  # Get a single tag
  result = api_instance.get_tag_by_id(id)
  p result
rescue LunchMoney::ApiError => e
  puts "Error when calling TagsApi->get_tag_by_id: #{e}"
end
```

#### Using the get_tag_by_id_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<TagObject>, Integer, Hash)> get_tag_by_id_with_http_info(id)

```ruby
begin
  # Get a single tag
  data, status_code, headers = api_instance.get_tag_by_id_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <TagObject>
rescue LunchMoney::ApiError => e
  puts "Error when calling TagsApi->get_tag_by_id_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | ID of the tag to retrieve |  |

### Return type

[**TagObject**](TagObject.md)

### Authorization

[cookieAuth](../README.md#cookieAuth), [bearerSecurity](../README.md#bearerSecurity)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## update_tag

> <TagObject> update_tag(id, update_tag_request_object)

Update an existing tag

Updates an existing tag.<br><br> You may submit the response from a `GET /tags/{id}` as the request body, however only certain properties can be updated using this API. The following system set properties are accepted in the request body but their values will be ignored: `id`, `updated_at`, `created_at`, and `archived_at`.<br><br> It is also possible to provide only the properties to be updated in the request body, as long as the request includes at least one of the properties that is not listed above. For example a request body that contains only a `name` attribute is valid.

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

api_instance = LunchMoney::TagsApi.new
id = 94319 # Integer | ID of the tag to update
update_tag_request_object = TODO # UpdateTagRequestObject | 

begin
  # Update an existing tag
  result = api_instance.update_tag(id, update_tag_request_object)
  p result
rescue LunchMoney::ApiError => e
  puts "Error when calling TagsApi->update_tag: #{e}"
end
```

#### Using the update_tag_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<TagObject>, Integer, Hash)> update_tag_with_http_info(id, update_tag_request_object)

```ruby
begin
  # Update an existing tag
  data, status_code, headers = api_instance.update_tag_with_http_info(id, update_tag_request_object)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <TagObject>
rescue LunchMoney::ApiError => e
  puts "Error when calling TagsApi->update_tag_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | ID of the tag to update |  |
| **update_tag_request_object** | [**UpdateTagRequestObject**](UpdateTagRequestObject.md) |  |  |

### Return type

[**TagObject**](TagObject.md)

### Authorization

[cookieAuth](../README.md#cookieAuth), [bearerSecurity](../README.md#bearerSecurity)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

