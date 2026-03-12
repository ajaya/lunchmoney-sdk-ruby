# LunchMoney::GetAllTransactions200Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **transactions** | [**Array&lt;TransactionObject&gt;**](TransactionObject.md) |  |  |
| **has_more** | **Boolean** | Set to true if more transactions are available |  |
| **error** | **String** |  | [optional] |

## Example

```ruby
require 'lunchmoney-sdk-ruby'

instance = LunchMoney::GetAllTransactions200Response.new(
  transactions: null,
  has_more: null,
  error: null
)
```

