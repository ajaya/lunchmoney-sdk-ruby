# LunchMoney::SummaryRecurringTransactionObject

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **date** | **Date** |  |  |
| **category_id** | **Integer** |  |  |
| **payee** | **String** |  |  |
| **to_base** | **Float** |  |  |
| **amount** | **String** |  |  |
| **currency** | [**CurrencyEnum**](CurrencyEnum.md) |  |  |

## Example

```ruby
require 'lunchmoney-sdk-ruby'

instance = LunchMoney::SummaryRecurringTransactionObject.new(
  date: null,
  category_id: null,
  payee: null,
  to_base: null,
  amount: null,
  currency: null
)
```

