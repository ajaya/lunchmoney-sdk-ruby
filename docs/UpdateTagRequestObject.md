# LunchMoney::UpdateTagRequestObject

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **name** | **String** | If set, the new name of the category. Must be between 1 and 100 characters. | [optional] |
| **description** | **String** | If set, the new description of the category. Must not exceed 200 characters. | [optional] |
| **text_color** | **String** | The text color of the tag. | [optional] |
| **background_color** | **String** | The background color of the tag. | [optional] |
| **archived** | **Boolean** | If set, will indicate if this category is archived. | [optional] |
| **id** | **Integer** | System-defined unique identifier for the category. Ignored if set. | [optional] |
| **updated_at** | **Time** | System-set time the tag was last updated. Ignored if set | [optional] |
| **created_at** | **Time** | System-set time the tag was created. Ignored if set. | [optional] |
| **archived_at** | **Time** | System-set time the tag was archived. Ignored if set. | [optional] |

## Example

```ruby
require 'lunchmoney-sdk-ruby'

instance = LunchMoney::UpdateTagRequestObject.new(
  name: null,
  description: null,
  text_color: null,
  background_color: null,
  archived: null,
  id: null,
  updated_at: null,
  created_at: null,
  archived_at: null
)
```

