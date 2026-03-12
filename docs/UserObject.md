# LunchMoney::UserObject

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **name** | **String** | The user&#39;s name |  |
| **email** | **String** | The user&#39;s email |  |
| **id** | **Integer** | Unique ID for the user |  |
| **account_id** | **Integer** | Unique ID for the linked budgeting account |  |
| **budget_name** | **String** | Name of the linked budgeting account |  |
| **primary_currency** | [**CurrencyEnum**](CurrencyEnum.md) | Primary currency set in the user&#39;s settings |  |
| **api_key_label** | **String** | Label assigned by the user to the API key being used. Returns null if no label is set |  |

## Example

```ruby
require 'lunchmoney-sdk-ruby'

instance = LunchMoney::UserObject.new(
  name: null,
  email: null,
  id: null,
  account_id: null,
  budget_name: null,
  primary_currency: null,
  api_key_label: null
)
```

