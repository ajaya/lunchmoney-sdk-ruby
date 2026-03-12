# LunchMoney::RecurringObjectTransactionCriteria

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **start_date** | **Date** | The beginning of the date range for matching transactions. If &#x60;null&#x60;, any transactions before end_date may be considered. |  |
| **end_date** | **Date** | The end of the date range for matching transactions. If &#x60;null&#x60;, any transactions after start_date may be considered. |  |
| **granularity** | **String** | The unit of time used to define the cadence of the recurring item. |  |
| **quantity** | **Integer** | The number of granularity units between each recurrence. |  |
| **anchor_date** | **Date** | The date used in conjunction with the &#x60;quantity&#x60; and &#x60;granularity&#x60; properties to calculate expected occurrences of recurring transactions. |  |
| **payee** | **String** | If set, represents the original transaction payee name that triggered this recurring item&#39;s creation. |  |
| **amount** | **String** | The expected amount for a transaction that will match this recurring item. For recurring items that have a flexible amount this is the average of the specified min and max amounts. |  |
| **to_base** | **Float** | The amount converted to the user&#39;s primary currency |  |
| **currency** | **String** | Three-letter lowercase currency code of the recurring item. |  |
| **plaid_account_id** | **Integer** | The Plaid account ID associated with the recurring item, if any. |  |
| **manual_account_id** | **Integer** | The manual account ID associated with the recurring item, if any. |  |

## Example

```ruby
require 'lunchmoney-sdk-ruby'

instance = LunchMoney::RecurringObjectTransactionCriteria.new(
  start_date: null,
  end_date: null,
  granularity: null,
  quantity: null,
  anchor_date: null,
  payee: null,
  amount: null,
  to_base: null,
  currency: null,
  plaid_account_id: null,
  manual_account_id: null
)
```

