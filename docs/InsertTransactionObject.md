# LunchMoney::InsertTransactionObject

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **date** | **Date** | Date of transaction in ISO 8601 format |  |
| **amount** | [**InsertTransactionObjectAmount**](InsertTransactionObjectAmount.md) |  |  |
| **currency** | [**CurrencyEnum**](CurrencyEnum.md) | Three-letter lowercase currency code of the transaction in ISO 4217 format. Must match one of the [supported currencies](https://alpha.lunchmoney.dev/v2/currencies). If not set defaults to the user account&#39;s primary currency. | [optional] |
| **payee** | **String** | Name of payee for the transaction | [optional] |
| **original_name** | **String** | Original payee name. If not provided, defaults to &#x60;payee&#x60; value. | [optional] |
| **category_id** | **Integer** | The ID of the category associated with the transactions. If set, the category ID must exist for the user&#39;s account and it cannot be a category group. | [optional] |
| **notes** | **String** | Any transaction notes set by the user or by  a matched recurring item. This will match the value  displayed in notes field on the transactions page in the GUI.  | [optional] |
| **manual_account_id** | **Integer** | The Unique identifier for the associated manually managed account. If set, this must match an existing manual account id associated with the user&#39;s account. If not set, and &#x60;plaid_account_id&#x60; is also not set, no account is associated with the transaction and it will appear as a \&quot;Cash Transaction\&quot; in the Lunch Money GUI. It is an error if this, and &#x60;plaid_account_id&#x60; is also set on the same transaction. | [optional] |
| **plaid_account_id** | **Integer** | The Unique identifier for the associated plaid synced account. If set, this must match an existing plaid account id associated with the user&#39;s account. If not set, and &#x60;manual_account_id&#x60; is also not set, no account is associated with the transaction and it will appear as a \&quot;Cash Transaction\&quot; in the Lunch Money GUI. It is an error if this, and &#x60;manual_account_id&#x60; is also set on the same transaction. In addition the specified plaid account must have the \&quot;Allow Modifications To Transactions\&quot; property set (which is enabled by default), or the insert will fail. | [optional] |
| **recurring_id** | **Integer** | Unique identifier for associated recurring item. Recurring item must be associated with the same account. | [optional] |
| **status** | **String** | If set must be either &#x60;reviewed&#x60; or &#x60;unreviewed&#x60;. If not set, defaults to &#x60;unreviewed&#x60;. | [optional] |
| **tag_ids** | **Array&lt;Integer&gt;** | A list of IDs for the tags associated with this transaction. Each ID must match an existing tag associated with the user&#39;s account. If not set, no tags will be associated with the created transaction. | [optional] |
| **external_id** | **String** | A user-defined external ID for the transaction. If set, and &#x60;manual_account_id&#x60; is set, the creation of the new transaction will fail if a transaction with this id already exists for the specified manual account. | [optional] |
| **custom_metadata** | **Hash&lt;String, Object&gt;** | An optional JSON object that includes additional data related to this transaction. This must be a valid JSON object and, when stringified, must not exceed 4096 characters. This data may be available in the future for processing by rules. | [optional] |

## Example

```ruby
require 'lunchmoney-sdk-ruby'

instance = LunchMoney::InsertTransactionObject.new(
  date: null,
  amount: null,
  currency: null,
  payee: null,
  original_name: null,
  category_id: null,
  notes: null,
  manual_account_id: null,
  plaid_account_id: null,
  recurring_id: null,
  status: null,
  tag_ids: null,
  external_id: null,
  custom_metadata: null
)
```

