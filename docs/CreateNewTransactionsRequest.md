# LunchMoney::CreateNewTransactionsRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **transactions** | [**Array&lt;InsertTransactionObject&gt;**](InsertTransactionObject.md) | List of transactions to insert. |  |
| **apply_rules** | **Boolean** | If &#x60;true&#x60;, any rules associated with the account specified by the &#x60;manual_account_id&#x60; property for each transaction will be applied. | [optional][default to false] |
| **skip_duplicates** | **Boolean** | If &#x60;true&#x60;, the system will flag new transactions that have the same &#x60;date&#x60;, &#x60;payee&#x60;, &#x60;amount&#x60;, and account_id (plaid or manual), as an existing transaction, as a duplicate. &lt;br&gt;&lt;br&gt; Note that deduplication based on &#x60;external_id&#x60; will always occur regardless of how this property is set. | [optional][default to false] |
| **skip_balance_update** | **Boolean** | If &#x60;true&#x60;, and new transactions include a &#x60;manual_account_id&#x60;, the balances of these accounts will not be updated, when the transactions are inserted. | [optional][default to false] |

## Example

```ruby
require 'lunchmoney-sdk-ruby'

instance = LunchMoney::CreateNewTransactionsRequest.new(
  transactions: null,
  apply_rules: null,
  skip_duplicates: null,
  skip_balance_update: null
)
```

