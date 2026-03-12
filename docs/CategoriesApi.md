# LunchMoney::CategoriesApi

All URIs are relative to *https://api.lunchmoney.dev/v2*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**create_category**](CategoriesApi.md#create_category) | **POST** /categories | Create a new category or category group |
| [**delete_category**](CategoriesApi.md#delete_category) | **DELETE** /categories/{id} | Delete a category or category group |
| [**get_all_categories**](CategoriesApi.md#get_all_categories) | **GET** /categories | Get all categories |
| [**get_category_by_id**](CategoriesApi.md#get_category_by_id) | **GET** /categories/{id} | Get a single category |
| [**update_category**](CategoriesApi.md#update_category) | **PUT** /categories/{id} | Update an existing category or category group |


## create_category

> <CategoryObject> create_category(create_category_request_object)

Create a new category or category group

Creates a new category with the given name.<br> If the `is_group` attribute is set to true, a category group is created. In this case, the `children` attribute may be set to an array of existing category IDs to add to the newly-created category group.

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

api_instance = LunchMoney::CategoriesApi.new
create_category_request_object = TODO # CreateCategoryRequestObject | 

begin
  # Create a new category or category group
  result = api_instance.create_category(create_category_request_object)
  p result
rescue LunchMoney::ApiError => e
  puts "Error when calling CategoriesApi->create_category: #{e}"
end
```

#### Using the create_category_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CategoryObject>, Integer, Hash)> create_category_with_http_info(create_category_request_object)

```ruby
begin
  # Create a new category or category group
  data, status_code, headers = api_instance.create_category_with_http_info(create_category_request_object)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CategoryObject>
rescue LunchMoney::ApiError => e
  puts "Error when calling CategoriesApi->create_category_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **create_category_request_object** | [**CreateCategoryRequestObject**](CreateCategoryRequestObject.md) |  |  |

### Return type

[**CategoryObject**](CategoryObject.md)

### Authorization

[cookieAuth](../README.md#cookieAuth), [bearerSecurity](../README.md#bearerSecurity)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## delete_category

> delete_category(id, opts)

Delete a category or category group

Attempts to delete the single category or category group specified on the path. By default, this will only work if there are no dependencies, such as existing budgets for the category, categorized transactions, children categories for a category group, categorized recurring items, etc. If there are dependents, this endpoint will return an object that describes the amount and type of existing dependencies.

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

api_instance = LunchMoney::CategoriesApi.new
id = 83 # Integer | ID of the category to delete
opts = {
  force: true # Boolean | Set to `true` to force deletion even if there are dependencies
}

begin
  # Delete a category or category group
  api_instance.delete_category(id, opts)
rescue LunchMoney::ApiError => e
  puts "Error when calling CategoriesApi->delete_category: #{e}"
end
```

#### Using the delete_category_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_category_with_http_info(id, opts)

```ruby
begin
  # Delete a category or category group
  data, status_code, headers = api_instance.delete_category_with_http_info(id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue LunchMoney::ApiError => e
  puts "Error when calling CategoriesApi->delete_category_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | ID of the category to delete |  |
| **force** | **Boolean** | Set to &#x60;true&#x60; to force deletion even if there are dependencies | [optional][default to false] |

### Return type

nil (empty response body)

### Authorization

[cookieAuth](../README.md#cookieAuth), [bearerSecurity](../README.md#bearerSecurity)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_all_categories

> <GetAllCategories200Response> get_all_categories(opts)

Get all categories

Retrieve a list of all categories associated with the user's account.

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

api_instance = LunchMoney::CategoriesApi.new
opts = {
  format: 'nested', # String | If `nested`, returns top-level categories (either category groups or categories not part of a category group) in alphabetical order. Grouped categories are nested within the category group under the property `children`. A `flattened`, response is similar but it includes grouped categories at the top level.<br/><br/> Categories are sorted by their `order`. When `order` is null, they are listed in alphabetical order below other categories with an `order`.
  is_group: true # Boolean | If `false`, only categories not part of a category group are returned.<br> If `true`, only category groups are returned.<br> When set, the `format` parameter is ignored.
}

begin
  # Get all categories
  result = api_instance.get_all_categories(opts)
  p result
rescue LunchMoney::ApiError => e
  puts "Error when calling CategoriesApi->get_all_categories: #{e}"
end
```

#### Using the get_all_categories_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetAllCategories200Response>, Integer, Hash)> get_all_categories_with_http_info(opts)

```ruby
begin
  # Get all categories
  data, status_code, headers = api_instance.get_all_categories_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetAllCategories200Response>
rescue LunchMoney::ApiError => e
  puts "Error when calling CategoriesApi->get_all_categories_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **format** | **String** | If &#x60;nested&#x60;, returns top-level categories (either category groups or categories not part of a category group) in alphabetical order. Grouped categories are nested within the category group under the property &#x60;children&#x60;. A &#x60;flattened&#x60;, response is similar but it includes grouped categories at the top level.&lt;br/&gt;&lt;br/&gt; Categories are sorted by their &#x60;order&#x60;. When &#x60;order&#x60; is null, they are listed in alphabetical order below other categories with an &#x60;order&#x60;. | [optional][default to &#39;nested&#39;] |
| **is_group** | **Boolean** | If &#x60;false&#x60;, only categories not part of a category group are returned.&lt;br&gt; If &#x60;true&#x60;, only category groups are returned.&lt;br&gt; When set, the &#x60;format&#x60; parameter is ignored. | [optional] |

### Return type

[**GetAllCategories200Response**](GetAllCategories200Response.md)

### Authorization

[cookieAuth](../README.md#cookieAuth), [bearerSecurity](../README.md#bearerSecurity)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_category_by_id

> <CategoryObject> get_category_by_id(id)

Get a single category

Retrieve details of a specific category or category group by its ID.

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

api_instance = LunchMoney::CategoriesApi.new
id = 315174 # Integer | ID of the category to retrieve

begin
  # Get a single category
  result = api_instance.get_category_by_id(id)
  p result
rescue LunchMoney::ApiError => e
  puts "Error when calling CategoriesApi->get_category_by_id: #{e}"
end
```

#### Using the get_category_by_id_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CategoryObject>, Integer, Hash)> get_category_by_id_with_http_info(id)

```ruby
begin
  # Get a single category
  data, status_code, headers = api_instance.get_category_by_id_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CategoryObject>
rescue LunchMoney::ApiError => e
  puts "Error when calling CategoriesApi->get_category_by_id_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | ID of the category to retrieve |  |

### Return type

[**CategoryObject**](CategoryObject.md)

### Authorization

[cookieAuth](../README.md#cookieAuth), [bearerSecurity](../README.md#bearerSecurity)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## update_category

> <CategoryObject> update_category(id, update_category_request_object)

Update an existing category or category group

Modifies the properties of an existing category or category group.<br><br> You may submit the response from a `GET /categories/{id}` as the request body; however, only certain properties can be updated using this API. The following properties are accepted in the request body but their values will be ignored: `id`, `is_group`,`archived_at`, `updated_at`, `created_at`, and `order`.<br><br> It is also possible to provide only the properties to be updated in the request body, as long as the request includes at least one of the properties that is not listed above. For example, a request body that contains only a `name` property is valid.<br><br> It is not possible to use this API to convert a category to a category group, or a vice versa, so while submitting a request body with the `is_group` property is tolerated, it will result in an error response if the value is changed.<br><br> It is possible to modify the children of an existing category group with this API by setting the `children` attribute. If this is set, it will replace the existing children with the newly specified children. If the intention is to add or remove a single category, it is more straightforward to update the child category by specifying the new `group_id` attribute. If the goal is to add multiple new children or remove multiple existing children, it is recommended to first call the `GET /categories/:id` endpoint to get the existing children and then modify the list as desired.<br><br>

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

api_instance = LunchMoney::CategoriesApi.new
id = 83 # Integer | ID of the category to update
update_category_request_object = TODO # UpdateCategoryRequestObject | 

begin
  # Update an existing category or category group
  result = api_instance.update_category(id, update_category_request_object)
  p result
rescue LunchMoney::ApiError => e
  puts "Error when calling CategoriesApi->update_category: #{e}"
end
```

#### Using the update_category_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CategoryObject>, Integer, Hash)> update_category_with_http_info(id, update_category_request_object)

```ruby
begin
  # Update an existing category or category group
  data, status_code, headers = api_instance.update_category_with_http_info(id, update_category_request_object)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CategoryObject>
rescue LunchMoney::ApiError => e
  puts "Error when calling CategoriesApi->update_category_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | ID of the category to update |  |
| **update_category_request_object** | [**UpdateCategoryRequestObject**](UpdateCategoryRequestObject.md) |  |  |

### Return type

[**CategoryObject**](CategoryObject.md)

### Authorization

[cookieAuth](../README.md#cookieAuth), [bearerSecurity](../README.md#bearerSecurity)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

