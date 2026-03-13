# LunchMoney::SplitTransactionObject

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **amount** | [**SplitTransactionObjectAmount**](SplitTransactionObjectAmount.md) |  |  |
| **payee** | **String** | The payee for the child transaction. Will inherit the original payee from the parent if not defined. | [optional] |
| **date** | **Date** | Must be in ISO 8601 format (YYYY-MM-DD). Will inherit from the parent if not defined. | [optional] |
| **category_id** | **Integer** | Unique identifier for associated category_id. Category must already exist for the account. Will inherit category from the parent if not defined. | [optional] |
| **tag_ids** | **Array&lt;Integer&gt;** | The IDs of any tags to apply to this split child transaction. Each ID must match an existing tag. | [optional] |
| **notes** | **String** | Will inherit notes from parent if not defined. | [optional] |

## Example

```ruby
require 'lunchmoney-sdk-ruby'

instance = LunchMoney::SplitTransactionObject.new(
  amount: null,
  payee: null,
  date: null,
  category_id: null,
  tag_ids: null,
  notes: null
)
```

