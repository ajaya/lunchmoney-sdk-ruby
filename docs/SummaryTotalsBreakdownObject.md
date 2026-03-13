# LunchMoney::SummaryTotalsBreakdownObject

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **other_activity** | **Float** | Total amount, in the user&#39;s default currency, of non recurring activity for the given date range | [optional] |
| **recurring_activity** | **Float** | Total amount, in the user&#39;s default currency, of recurring activity that has occurred for the given date range | [optional] |
| **recurring_remaining** | **Float** | Total amount, in the user&#39;s default currency, of expected recurring activity that has not yet occurred | [optional] |
| **recurring_expected** | **Float** | Total amount, in the user&#39;s default currency, of expected recurring activity for the given date range | [optional] |
| **uncategorized** | **Float** | Total amount, in the user&#39;s default currency, of non recurring activity coming from un-categorized transactions | [optional] |
| **uncategorized_count** | **Integer** | Number of un-categorized transactions for the given date range | [optional] |
| **uncategorized_recurring** | **Float** | Total amount, in the user&#39;s default currency, of recurring activity coming from un-categorized transactions. | [optional] |

## Example

```ruby
require 'lunchmoney-sdk-ruby'

instance = LunchMoney::SummaryTotalsBreakdownObject.new(
  other_activity: null,
  recurring_activity: null,
  recurring_remaining: null,
  recurring_expected: null,
  uncategorized: null,
  uncategorized_count: null,
  uncategorized_recurring: null
)
```

