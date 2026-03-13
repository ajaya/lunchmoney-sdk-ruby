# LunchMoney::BudgetSettingsResponseObject

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **budget_period_granularity** | **String** | Budget period granularity |  |
| **budget_period_quantity** | **Float** | The number of &#x60;granularity&#x60; units that make up a single budgeting period. |  |
| **budget_period_anchor_date** | **Date** | The date from which the budgeting period is calculated. All future (and past) periods are derived by applying &#x60;quantity&#x60; × &#x60;granularity&#x60; forward and backward from this date. |  |
| **budget_hide_no_activity** | **Boolean** | The display preference for hiding categories in budget view that have no activity and no budgeted value | [default to false] |
| **budget_use_last_day_of_month** | **Boolean** | The display preference for using the last day of the month as the period end for monthly periods | [default to false] |
| **budget_income_option** | **String** | Determines which income value is used as the base when calculating available funds for a budgeting period |  |
| **budget_rollover_left_to_budget** | **Boolean** | Determines whether the remaining unallocated funds (“Left to Budget”) at the end of a budgeting period are carried forward to the next period | [default to false] |

## Example

```ruby
require 'lunchmoney-sdk-ruby'

instance = LunchMoney::BudgetSettingsResponseObject.new(
  budget_period_granularity: null,
  budget_period_quantity: null,
  budget_period_anchor_date: null,
  budget_hide_no_activity: null,
  budget_use_last_day_of_month: null,
  budget_income_option: null,
  budget_rollover_left_to_budget: null
)
```

