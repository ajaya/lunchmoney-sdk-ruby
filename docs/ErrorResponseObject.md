# LunchMoney::ErrorResponseObject

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **message** | **String** | High level error type, for example &#39;Not Found&#39; or &#39;Request Validation Failure&#39; |  |
| **errors** | [**Array&lt;ErrorResponseObjectErrorsInner&gt;**](ErrorResponseObjectErrorsInner.md) | An list of objects that describe the errors encountered while processing the request.&lt;br&gt; If multiple errors were encountered, the list will contain multiple objects.&lt;br&gt; Each &#x60;error&#x60; object is guaranteed to have an &#x60;errMsg&#x60;, but it may also contain other error specific properties. |  |

## Example

```ruby
require 'lunchmoney-sdk-ruby'

instance = LunchMoney::ErrorResponseObject.new(
  message: null,
  errors: null
)
```

