# LunchMoney::BudgetUpsertResponseObject

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **category_id** | **Integer** | Category ID | [optional] |
| **start_date** | **Date** | Start date of the budget period | [optional] |
| **amount** | **String** | Budget amount in the stored currency (string for consistency with other amount fields in the API) | [optional] |
| **currency** | **String** | Currency code for the budget | [optional] |
| **to_base** | **Float** | Amount converted to the user&#39;s primary currency | [optional] |
| **notes** | **String** | Notes for the budget period | [optional] |

## Example

```ruby
require 'lunchmoney-sdk-ruby'

instance = LunchMoney::BudgetUpsertResponseObject.new(
  category_id: null,
  start_date: null,
  amount: null,
  currency: null,
  to_base: null,
  notes: null
)
```

