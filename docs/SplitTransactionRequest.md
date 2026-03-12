# LunchMoney::SplitTransactionRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **child_transactions** | [**Array&lt;SplitTransactionObject&gt;**](SplitTransactionObject.md) | List of child transactions to create. The sum of the &#x60;amounts&#x60; must match the split transaction amount. |  |

## Example

```ruby
require 'lunchmoney-sdk-ruby'

instance = LunchMoney::SplitTransactionRequest.new(
  child_transactions: null
)
```

