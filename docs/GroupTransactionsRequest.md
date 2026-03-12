# LunchMoney::GroupTransactionsRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **ids** | **Array&lt;Integer&gt;** | List of existing transaction IDs to group. Split and recurring transactions may not be grouped. Transactions that are already grouped must be ungrouped before being regrouped. |  |
| **date** | **Date** | Date for the new grouped transaction in ISO 8601 format. |  |
| **payee** | **String** | The payee for the new grouped transaction.  |  |
| **category_id** | **Integer** | The ID of an existing category to assign to the grouped transaction. If not set and all the grouped transactions have the same category, the grouped transaction will inherit the category, otherwise the new transaction will have no category. | [optional] |
| **notes** | **String** | Notes for the grouped transaction.  | [optional] |
| **status** | **String** | If set must be either &#x60;reviewed&#x60; or &#x60;unreviewed&#x60;. If not set, defaults to &#x60;reviewed&#x60;. | [optional] |
| **tag_ids** | **Array&lt;Integer&gt;** | A list of IDs for the tags associated with the grouped transaction. Each ID must match an existing tag associated with the user&#39;s account. If not set, no tags will be associated with the created transaction. | [optional] |

## Example

```ruby
require 'lunchmoney-sdk-ruby'

instance = LunchMoney::GroupTransactionsRequest.new(
  ids: null,
  date: null,
  payee: null,
  category_id: null,
  notes: null,
  status: null,
  tag_ids: null
)
```

