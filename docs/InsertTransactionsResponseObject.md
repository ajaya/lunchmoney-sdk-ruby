# LunchMoney::InsertTransactionsResponseObject

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **transactions** | [**Array&lt;TransactionObject&gt;**](TransactionObject.md) | An array of the inserted transactions. |  |
| **skipped_duplicates** | [**Array&lt;SkippedExistingExternalIdObject&gt;**](SkippedExistingExternalIdObject.md) | An array of the requested transactions that were duplicates of existing transactions and were not inserted. |  |

## Example

```ruby
require 'lunchmoney-sdk-ruby'

instance = LunchMoney::InsertTransactionsResponseObject.new(
  transactions: null,
  skipped_duplicates: null
)
```

