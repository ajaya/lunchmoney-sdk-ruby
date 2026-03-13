# LunchMoney::SummaryRolloverPoolObject

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **budgeted_to_base** | **Float** | Amount of funds, in the user&#39;s default currency, currently available to rollover. |  |
| **all_adjustments** | [**Array&lt;SummaryRolloverPoolAdjustmentObject&gt;**](SummaryRolloverPoolAdjustmentObject.md) | List of previous adjustments to the rollover pool |  |

## Example

```ruby
require 'lunchmoney-sdk-ruby'

instance = LunchMoney::SummaryRolloverPoolObject.new(
  budgeted_to_base: null,
  all_adjustments: null
)
```

