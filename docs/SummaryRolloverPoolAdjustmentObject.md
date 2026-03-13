# LunchMoney::SummaryRolloverPoolAdjustmentObject

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **in_range** | **Boolean** | true if this rollover pool adjustment is for a budget period that falls within the given date range. |  |
| **date** | **Date** | Date the adjustment was made. |  |
| **amount** | **String** | Amount of the rollover pool, in the budgets currency, at the time of the adjustment. |  |
| **currency** | [**CurrencyEnum**](CurrencyEnum.md) | Currency of the rollover pool at the time of the adjustment. |  |
| **to_base** | **Float** | Amount of the rollover pool, in the user&#39;s default currency, at the time of the adjustment. |  |

## Example

```ruby
require 'lunchmoney-sdk-ruby'

instance = LunchMoney::SummaryRolloverPoolAdjustmentObject.new(
  in_range: null,
  date: null,
  amount: null,
  currency: null,
  to_base: null
)
```

