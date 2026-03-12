# LunchMoney::UpdateTransactionsRequestTransactionsInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | The ID of the transaction to update |  |
| **date** | **Date** | Date of transaction in ISO 8601 format | [optional] |
| **amount** | [**UpdateTransactionObjectAmount**](UpdateTransactionObjectAmount.md) |  | [optional] |
| **currency** | [**CurrencyEnum**](CurrencyEnum.md) | Three-letter lowercase currency code of the transaction in ISO 4217 format.&lt;br&gt; May not be updated on transactions that belong to a synced account with the \&quot;Allow Modifications to Transactions\&quot; property disabled. | [optional] |
| **recurring_id** | **Integer** | The unique identifier of the associated recurring item that this transaction matches. | [optional] |
| **payee** | **String** | The new payee for the transaction.  | [optional] |
| **original_name** | **String** | Original payee name. Cannot be changed. Ignored if set. | [optional] |
| **category_id** | **Integer** | Unique identifier of the category for this transaction. Set this to null to clear the transaction&#39;s category. | [optional] |
| **notes** | **String** | New notes for the transaction. Set this to an empty string to clear the existing notes.  | [optional] |
| **manual_account_id** | **Integer** | The unique identifier of the manual account associated with this transaction. Set this to null to disassociate the transaction with an account. If set &#x60;plaid_account_id&#x60; may not also be set to a non null value. Moving an existing transaction to to another account will not work if the transaction belongs to a synced account who&#39;s \&quot;Allow Modifications to Transactions\&quot; property is not set. | [optional] |
| **plaid_account_id** | **Integer** | The unique identifier of the plaid account associated with this transaction. If set &#x60;manual_account_id&#x60; may not also be set to a non null value. Attempting to modify this on a transaction associated with a Plaid account will not work if the account&#39;s \&quot;Allow Modifications to Transactions\&quot; property is not set. Similarly, this cannot be set to an id associated with this type of locked Plaid account. | [optional] |
| **tag_ids** | **Array&lt;Integer&gt;** | A list of tag_ids for the tags associated with this transaction. If set, this property will overwrite any existing tags. Use &#x60;additional_tag_ids&#x60; to add tags to the existing transaction&#39;s tags. Set this to an empty array to remove all tags from a transaction. If set &#x60;additional_tag_ids&#x60; may not be set. | [optional] |
| **additional_tag_ids** | **Array&lt;Integer&gt;** | A list of tag_ids for the tags associated with this transaction. If set, the tags listed in this property be added to any existing transaction tags. Use &#x60;tag_ids&#x60; to overwrite or clear transaction tags. If set &#x60;tag_ids&#x60; may not be set. | [optional] |
| **external_id** | **String** | A user-defined external ID for the transaction. The update will fail if the transaction does not also have a &#x60;manual_account_id&#x60; or if there is already an existing transaction with the same &#x60;manual_account_id&#x60;/&#x60;external_id&#x60; combination. | [optional] |
| **custom_metadata** | **Object** | User defined JSON data that can be set or cleared via the API. | [optional] |
| **status** | **String** | Status of the transaction, may be one of: - &#x60;reviewed&#x60;: User has reviewed the transaction, or it was automatically marked as reviewed due to reviewed recurring_item logic - &#x60;unreviewed&#x60;: User has not reviewed the transaction and it does not match any reviewed recurring_items.  | [optional] |
| **to_base** | **Float** | System defined amount of this transaction in the user&#39;s primary currency. Ignored if set. Use &#x60;amount&#x60; to update the amount in the transaction. | [optional] |
| **is_pending** | **Boolean** | System defined flag set for pending transactions. Ignored if set. | [optional] |
| **plaid_metadata** | **Object** | System set metadata from a Plaid account sync. Ignored if set. | [optional] |
| **created_at** | **Time** | System defined date and time of when the transaction was created. Ignored if set. | [optional] |
| **updated_at** | **Time** | System defined date and time of when the transaction was last updated. Ignored if set. | [optional] |
| **is_split_parent** | **Boolean** | System defined boolean indicating if this transaction was split. To split or unsplit a transaction use the &#x60;/transactions/split&#x60; endpoint. Ignored if set. | [optional] |
| **children** | [**Array&lt;ChildTransactionObject&gt;**](ChildTransactionObject.md) | An array of child transactions that exists when a transaction has been split or if the transaction is a group. Split | [optional] |
| **split_parent_id** | **Integer** | A transaction ID if this is a split transaction. Split transactions may not be modified this API. Use the &#x60;transactions/split&#x60; endpoint instead. Ignored if set. | [optional] |
| **is_group_parent** | **Boolean** | System defined boolean indicating if this transaction represents a group of transactions. Grouped transactions may not be modified with this API. Use the &#x60;transactions/group&#x60; endpoint instead. Ignored if set. | [optional] |
| **group_parent_id** | **Integer** | A transaction group ID if this transaction is part of a group. Grouped transactions may not be modified with this API. Use the &#x60;transactions/group&#x60; endpoint instead. Ignored if set. | [optional] |
| **source** | **String** | System defined original source of the transaction. Ignored if set.  | [optional] |

## Example

```ruby
require 'lunchmoney-sdk-ruby'

instance = LunchMoney::UpdateTransactionsRequestTransactionsInner.new(
  id: null,
  date: null,
  amount: null,
  currency: null,
  recurring_id: null,
  payee: null,
  original_name: null,
  category_id: null,
  notes: null,
  manual_account_id: null,
  plaid_account_id: null,
  tag_ids: null,
  additional_tag_ids: null,
  external_id: null,
  custom_metadata: null,
  status: null,
  to_base: null,
  is_pending: null,
  plaid_metadata: null,
  created_at: null,
  updated_at: null,
  is_split_parent: null,
  children: null,
  split_parent_id: null,
  is_group_parent: null,
  group_parent_id: null,
  source: null
)
```

