# LunchMoney::BudgetInvalidPeriodErrorObject

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **message** | **String** | Overall error message (e.g. Invalid Request) |  |
| **requested_start_date** | **Date** | The start_date value that was rejected |  |
| **previous_valid_start_date** | **Date** | The previous valid budget period start date before the requested date | [optional] |
| **next_valid_start_date** | **Date** | The next valid budget period start date after the requested date | [optional] |
| **err_msg** | **String** | Human-readable error message |  |

## Example

```ruby
require 'lunchmoney-sdk-ruby'

instance = LunchMoney::BudgetInvalidPeriodErrorObject.new(
  message: null,
  requested_start_date: null,
  previous_valid_start_date: null,
  next_valid_start_date: null,
  err_msg: null
)
```

