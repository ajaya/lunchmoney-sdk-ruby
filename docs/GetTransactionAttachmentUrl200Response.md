# LunchMoney::GetTransactionAttachmentUrl200Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **url** | **String** | The signed url to download the file attachment |  |
| **expires_at** | **Time** | The date and time the signed url will expire |  |

## Example

```ruby
require 'lunchmoney-sdk-ruby'

instance = LunchMoney::GetTransactionAttachmentUrl200Response.new(
  url: null,
  expires_at: null
)
```

