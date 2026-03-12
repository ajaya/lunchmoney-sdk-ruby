# LunchMoney::RecurringObjectMatchesFoundTransactionsInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **date** | **Date** | The date for a matching transaction within the specified range. | [optional] |
| **transaction_id** | **Integer** | The ID of a matching transaction within the specified range. | [optional] |

## Example

```ruby
require 'lunchmoney-sdk-ruby'

instance = LunchMoney::RecurringObjectMatchesFoundTransactionsInner.new(
  date: null,
  transaction_id: null
)
```

