# LunchMoney::TagObject

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | Unique identifier for the tag. |  |
| **name** | **String** | Name of the tag. |  |
| **description** | **String** | Description of the tag. |  |
| **text_color** | **String** | The text color of the tag. |  |
| **background_color** | **String** | The background color of the tag. |  |
| **updated_at** | **Time** | The date and time of when the tag was last updated (in the ISO 8601 extended format). |  |
| **created_at** | **Time** | The date and time of when the tag was created (in the ISO 8601 extended format). |  |
| **archived** | **Boolean** | If &#x60;true&#x60;, the tag will not show up when creating or updating transactions in the Lunch Money app. **Can it be assigned via the API** |  |
| **archived_at** | **Time** | The date and time of when the tag was last archived or &#x60;null&#x60; if not archived |  |

## Example

```ruby
require 'lunchmoney-sdk-ruby'

instance = LunchMoney::TagObject.new(
  id: null,
  name: null,
  description: null,
  text_color: null,
  background_color: null,
  updated_at: null,
  created_at: null,
  archived: null,
  archived_at: null
)
```

