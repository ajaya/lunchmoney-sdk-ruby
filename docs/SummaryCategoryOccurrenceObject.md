# LunchMoney::SummaryCategoryOccurrenceObject

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **in_range** | **Boolean** | &#x60;true&#x60; if this occurrence is within the given date range, &#x60;false&#x60; if it was included because the &#x60;include_past_budget_periods&#x60; parameter was set to &#x60;true&#x60;. |  |
| **start_date** | **Date** | The start date of the budget period |  |
| **end_date** | **Date** | The end date of the budget period |  |
| **other_activity** | **Float** | Total non recurring activity, in the user&#39;s default currency, for the budget period. The total activity for this category in the period is the sum of this and the recurring_activity. |  |
| **recurring_activity** | **Float** | Total recurring activity, in the user&#39;s default currency, for the budget period. The total activity for this category in the budget period is the sum of this and the other_activity. |  |
| **budgeted** | **Float** | Total budgeted amount, in the user&#39;s primary currency, for the period, or &#x60;null&#x60; if no budget was set. |  |
| **budgeted_amount** | **String** | Total budgeted amount, in the budgeted currency, for the category within the period, or &#x60;null&#x60; if no budget was set. |  |
| **budgeted_currency** | [**CurrencyEnum**](CurrencyEnum.md) | Currency of the budgeted amount |  |
| **notes** | **String** | Any notes set for the budget period. |  |

## Example

```ruby
require 'lunchmoney-sdk-ruby'

instance = LunchMoney::SummaryCategoryOccurrenceObject.new(
  in_range: null,
  start_date: null,
  end_date: null,
  other_activity: null,
  recurring_activity: null,
  budgeted: null,
  budgeted_amount: null,
  budgeted_currency: null,
  notes: null
)
```

