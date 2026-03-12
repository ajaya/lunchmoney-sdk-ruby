# LunchMoney::UpdateTransactionsRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **transactions** | [**Array&lt;UpdateTransactionsRequestTransactionsInner&gt;**](UpdateTransactionsRequestTransactionsInner.md) | List of transactions to update. Each transaction must have an &#x60;id&#x60; property and at least one other property to update. |  |

## Example

```ruby
require 'lunchmoney-sdk-ruby'

instance = LunchMoney::UpdateTransactionsRequest.new(
  transactions: null
)
```

