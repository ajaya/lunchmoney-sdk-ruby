# LunchMoney::BudgetObject

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | System created unique identifier for the budget entry. |  |
| **category_id** | **Integer** | The ID of the category this budget applies to. |  |
| **amount** | **Float** | The budgeted amount for this period. |  |
| **currency** | [**CurrencyEnum**](CurrencyEnum.md) | The currency of the budgeted amount in ISO 4217 format. |  |
| **start_date** | **Date** | The start date of the budget period in ISO 8601 format (YYYY-MM-DD). This represents the beginning of the period for which this budget applies. |  |
| **next_start_date** | **Date** | The calculated start date of the next budget period based on the category&#39;s period settings (granularity, quantity, and anchor_date). This is useful for determining when the next budget period begins. | [readonly] |
| **notes** | **String** | Optional notes associated with this budget period. | [optional] |
| **auto_budget_type** | **String** | The budget preset type that determines how future periods will be automatically calculated. &#x60;nothing&#x60; means no automatic calculation (budgets must be set manually for each period). &#x60;fixed&#x60; uses a fixed amount for all future periods. &#x60;spend&#x60; uses the previous period&#39;s spending amount. &#x60;budget&#x60; uses the previous period&#39;s budgeted amount. | [readonly] |
| **auto_budget_amount** | **Float** | If &#x60;auto_budget_type&#x60; is &#x60;fixed&#x60;, this is the fixed amount that will be used for future periods. | [optional][readonly] |
| **auto_budget_currency** | [**CurrencyEnum**](CurrencyEnum.md) | If &#x60;auto_budget_type&#x60; is &#x60;fixed&#x60;, this is the currency of the fixed amount. | [optional][readonly] |
| **rollover_option** | **String** | The rollover setting for this category. &#x60;same category&#x60; means unspent funds roll over to the next period for this category. &#x60;available funds&#x60; means unspent funds are added to the available funds pool. &#x60;null&#x60; means rollover is disabled. | [optional][readonly] |
| **granularity** | **String** | The granularity of the budget period (e.g., monthly, weekly, twice a month). This is determined by the category&#39;s custom budget settings or the account&#39;s default budget period settings. | [readonly] |
| **quantity** | **Integer** | The quantity of granularity units that make up each budget period. For example, if granularity is &#x60;week&#x60; and quantity is &#x60;2&#x60;, each budget period is 2 weeks. | [readonly] |
| **is_group** | **Boolean** | Whether the category is a category group. Category groups can have their own budgets that apply to all subcategories, or subcategories can have individual budgets. | [readonly] |
| **group_id** | **Integer** | If this budget is for a subcategory, this is the ID of the parent category group. &#x60;null&#x60; if this is not a subcategory. | [optional][readonly] |
| **created_at** | **Time** | The date and time when this budget entry was created (in ISO 8601 extended format). |  |
| **updated_at** | **Time** | The date and time when this budget entry was last updated (in ISO 8601 extended format). |  |

## Example

```ruby
require 'lunchmoney-sdk-ruby'

instance = LunchMoney::BudgetObject.new(
  id: null,
  category_id: null,
  amount: null,
  currency: null,
  start_date: null,
  next_start_date: null,
  notes: null,
  auto_budget_type: null,
  auto_budget_amount: null,
  auto_budget_currency: null,
  rollover_option: null,
  granularity: null,
  quantity: null,
  is_group: null,
  group_id: null,
  created_at: null,
  updated_at: null
)
```

