# LunchMoney::PlaidAccountObject

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | The unique identifier of this account |  |
| **plaid_item_id** | **String** | The unique identifier of the Plaid connection that this account belongs to. Accounts with the same plaid_item_id usually belong to the same institution. |  |
| **date_linked** | **Date** | Date account was first linked in ISO 8601 format |  |
| **linked_by_name** | **String** | The name of the user who linked the account |  |
| **name** | **String** | Name of the account. This field is set by Plaid and cannot be altered. |  |
| **display_name** | **String** | Optional display name for the account set by the user. If not set, it will return a concatenated string of institution and account name. |  |
| **type** | **String** | Primary type of the account, such as &#x60;credit&#x60;, &#x60;depository&#x60;, etc. This field is set by Plaid and cannot be altered. |  |
| **subtype** | **String** | Optional account subtype. This field is set by Plaid and cannot be altered. |  |
| **mask** | **String** | Mask (last 3 to 4 digits of account) of account. This field is set by Plaid and cannot be altered. |  |
| **institution_name** | **String** | Name of institution holding the account. This field is set by Plaid and cannot be altered. |  |
| **status** | **String** | Denotes the current status of the account within Lunch Money. Must be one of&lt;br&gt; - active: Account is actively syncing transactions and/or balance&lt;br&gt; - inactive: Account marked inactive from user. Transaction imports and balance updates will not occur for this account.&lt;br&gt; - closed: Account is marked as closed&lt;br&gt; - deactivated: Account is marked deactivated during setup. The user must click &#x60;Add/Remove Accounts From This Bank&#x60; and manually re-select this account to activate it.&#39;&lt;br&gt; - not found: Account was once linked but can no longer be found with Plaid.&lt;br&gt; - not supported: Account is not supported by Plaid.&lt;br&gt; - relink: Account (and others with the same connection) need to be relinked with Plaid.&lt;br&gt; - syncing: Account is awaiting the first import of transactions.&lt;br&gt; - revoked: Account connection has been revoked by Plaid and syncing is no longer possible. A new connection needs to be set up again.&lt;br&gt; - error: Account (and others with the same connection) is in error with Plaid and requires intervention to re-activate it.&lt;br&gt; |  |
| **allow_transaction_modifications** | **Boolean** | If &#x60;false&#x60;, transactions imported for this synced account can have their properties (such as amount and account) be modified by the user. This option is managed in the web app. |  |
| **limit** | **Float** | Optional credit limit of the account. This field is set by Plaid and cannot be altered |  |
| **balance** | **String** | Current balance of the account in numeric format to 4 decimal places. This field is set by Plaid and cannot be altered. |  |
| **currency** | **String** | Three-letter lowercase currency code of the account balance |  |
| **to_base** | **Float** | The account balance converted to the user&#39;s primary currency |  |
| **balance_last_update** | **Time** | Date balance was last updated in ISO 8601 extended format. This field is set by Plaid and cannot be altered. |  |
| **import_start_date** | **Date** | Date of earliest date allowed for importing transactions. Transactions earlier than this date are not imported. |  |
| **last_import** | **Time** | Timestamp in ISO 8601 extended format of the last time Lunch Money imported new data from Plaid for this account. |  |
| **last_fetch** | **Time** | Timestamp in ISO 8601 extended format of the last successful request from Lunch Money for updated data or timestamps from Plaid in ISO 8601 extended format (not necessarily date of last successful import) |  |
| **plaid_last_successful_update** | **Time** | Timestamp in ISO 8601 extended format of the last time Plaid successfully connected with institution for new transaction updates, regardless of whether any new data was available in the update. |  |

## Example

```ruby
require 'lunchmoney-sdk-ruby'

instance = LunchMoney::PlaidAccountObject.new(
  id: null,
  plaid_item_id: null,
  date_linked: null,
  linked_by_name: null,
  name: null,
  display_name: null,
  type: null,
  subtype: null,
  mask: null,
  institution_name: null,
  status: null,
  allow_transaction_modifications: null,
  limit: null,
  balance: null,
  currency: null,
  to_base: null,
  balance_last_update: null,
  import_start_date: null,
  last_import: null,
  last_fetch: null,
  plaid_last_successful_update: null
)
```

