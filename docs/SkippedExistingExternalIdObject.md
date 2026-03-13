# LunchMoney::SkippedExistingExternalIdObject

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **reason** | **String** | The reason the transaction was skipped, may be one of: - &#x60;duplicate_external_id&#x60;: The transaction has the same &#x60;manual_account_id&#x60; and &#x60;external_id&#x60; as an existing transaction - &#x60;duplicate_payee_amount_date&#x60;: The &#x60;skip_duplicates&#x60; request body property was set to &#x60;true&#x60; and the transaction has the same &#x60;amount&#x60;, &#x60;payee&#x60;, and &#x60;date&#x60; as an existing transaction associated with the same account.  | [optional] |
| **request_transactions_index** | **Integer** | The  of the transaction in the request body&#39;s transactions array that was skipped. | [optional] |
| **existing_transaction_id** | **Integer** | The id of the existing transactions that the requested transaction duplicates. | [optional] |
| **request_transaction** | [**InsertTransactionObject**](InsertTransactionObject.md) | The requested transaction that was skipped. | [optional] |

## Example

```ruby
require 'lunchmoney-sdk-ruby'

instance = LunchMoney::SkippedExistingExternalIdObject.new(
  reason: null,
  request_transactions_index: null,
  existing_transaction_id: null,
  request_transaction: null
)
```

