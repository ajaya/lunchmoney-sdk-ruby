# LunchMoney::UpsertBudget400Response

## Class instance methods

### `openapi_one_of`

Returns the list of classes defined in oneOf.

#### Example

```ruby
require 'lunchmoney-sdk-ruby'

LunchMoney::UpsertBudget400Response.openapi_one_of
# =>
# [
#   :'BudgetInvalidPeriodErrorObject',
#   :'ErrorResponseObject'
# ]
```

### build

Find the appropriate object from the `openapi_one_of` list and casts the data into it.

#### Example

```ruby
require 'lunchmoney-sdk-ruby'

LunchMoney::UpsertBudget400Response.build(data)
# => #<BudgetInvalidPeriodErrorObject:0x00007fdd4aab02a0>

LunchMoney::UpsertBudget400Response.build(data_that_doesnt_match)
# => nil
```

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| **data** | **Mixed** | data to be matched against the list of oneOf items |

#### Return type

- `BudgetInvalidPeriodErrorObject`
- `ErrorResponseObject`
- `nil` (if no type matches)

