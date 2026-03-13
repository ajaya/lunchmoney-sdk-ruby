# LunchMoney::CreateTagRequestObject

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **name** | **String** | The name of the new tag. Must be between 1 and 100 characters. Must not match the name of any existing tags. |  |
| **description** | **String** | The description of the tag. Must not exceed 200 characters. | [optional] |
| **text_color** | **String** | The text color of the tag. | [optional] |
| **background_color** | **String** | The background color of the tag. | [optional] |
| **archived** | **Boolean** | If &#x60;true&#x60;, the tag is archived and not displayed in relevant areas of the Lunch Money app. | [optional][default to false] |

## Example

```ruby
require 'lunchmoney-sdk-ruby'

instance = LunchMoney::CreateTagRequestObject.new(
  name: null,
  description: null,
  text_color: null,
  background_color: null,
  archived: null
)
```

