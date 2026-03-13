# LunchMoney::UpsertBudgetRequestObject

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **start_date** | **Date** | Start date of the budget period in ISO 8601 date format (YYYY-MM-DD). Must be a valid budget period start for the account. |  |
| **category_id** | **Integer** | Category ID for the budget |  |
| **amount** | [**UpsertBudgetRequestObjectAmount**](UpsertBudgetRequestObjectAmount.md) |  |  |
| **currency** | [**CurrencyEnum**](CurrencyEnum.md) | Three-letter currency code. If omitted, the primary currency for the user&#39;s account is used. | [optional] |
| **notes** | **String** | Optional notes for the budget period | [optional] |

## Example

```ruby
require 'lunchmoney-sdk-ruby'

instance = LunchMoney::UpsertBudgetRequestObject.new(
  start_date: null,
  category_id: null,
  amount: null,
  currency: null,
  notes: null
)
```

