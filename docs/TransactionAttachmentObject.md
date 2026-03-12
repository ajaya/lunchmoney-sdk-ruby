# LunchMoney::TransactionAttachmentObject

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | The unique identifier of the attachment | [optional] |
| **uploaded_by** | **Integer** | The id of the user who uploaded the attachment | [optional] |
| **name** | **String** | The name of the file | [optional] |
| **type** | **String** | The MIME type of the file | [optional] |
| **size** | **Integer** | The size of the file in kilobytes | [optional] |
| **notes** | **String** | Optional notes about the attachment | [optional] |
| **created_at** | **Time** | The date and time when the attachment was created in ISO 8601 format | [optional] |

## Example

```ruby
require 'lunchmoney-sdk-ruby'

instance = LunchMoney::TransactionAttachmentObject.new(
  id: null,
  uploaded_by: null,
  name: null,
  type: null,
  size: null,
  notes: null,
  created_at: null
)
```

