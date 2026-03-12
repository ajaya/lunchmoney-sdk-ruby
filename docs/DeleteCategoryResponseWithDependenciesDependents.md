# LunchMoney::DeleteCategoryResponseWithDependenciesDependents

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **budget** | **Integer** | The number of budgets depending on the category |  |
| **category_rules** | **Integer** | The number of category rules depending on the category |  |
| **transactions** | **Integer** | The number of transactions depending on the category |  |
| **children** | **Integer** | The number of child categories in the category group |  |
| **recurring** | **Integer** | The number of recurring transactions depending on the category |  |
| **plaid_cats** | **Integer** | The number of auto created categories based on Plaid categories |  |

## Example

```ruby
require 'lunchmoney-sdk-ruby'

instance = LunchMoney::DeleteCategoryResponseWithDependenciesDependents.new(
  budget: null,
  category_rules: null,
  transactions: null,
  children: null,
  recurring: null,
  plaid_cats: null
)
```

