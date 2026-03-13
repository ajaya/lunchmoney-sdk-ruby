# LunchMoney::SummaryCategoryTotalsObject

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **other_activity** | **Float** | Total non recurring activity, in the user&#39;s default currency, for the category within the given date range.&lt;br&gt; The total activity for the category is the sum of this and the recurring_activity. |  |
| **recurring_activity** | **Float** | Total recurring activity, in the user&#39;s default currency, for the category within the given date range.&lt;br&gt; The total activity for the category is the sum of this and the other_activity. |  |
| **budgeted** | **Float** | Total budgeted amount, in the user&#39;s default currency, for the category within the given date range or null if the category is not budgeted. This property will not be present in a non-aligned response. | [optional] |
| **available** | **Float** | Total amount of funds available, in the user&#39;s default currency, for the category within the given date range. This property will not be present in a non-aligned response. | [optional] |
| **recurring_remaining** | **Float** | Total expected recurring activity, in the user&#39;s default currency, that has not yet occurred for the category within the given date range. |  |
| **recurring_expected** | **Float** | Total expected recurring activity for the category within the given date range. |  |

## Example

```ruby
require 'lunchmoney-sdk-ruby'

instance = LunchMoney::SummaryCategoryTotalsObject.new(
  other_activity: null,
  recurring_activity: null,
  budgeted: null,
  available: null,
  recurring_remaining: null,
  recurring_expected: null
)
```

