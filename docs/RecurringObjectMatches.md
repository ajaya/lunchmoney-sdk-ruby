# LunchMoney::RecurringObjectMatches

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **request_start_date** | **Date** | The beginning of the date range that this request used to find matching transactions. | [optional] |
| **request_end_date** | **Date** | The beginning of the date range that this request used to find matching transactions. | [optional] |
| **expected_occurrence_dates** | **Array&lt;Date&gt;** | A list of dates within the specified range where a recurring transactions is expected. | [optional] |
| **found_transactions** | [**Array&lt;RecurringObjectMatchesFoundTransactionsInner&gt;**](RecurringObjectMatchesFoundTransactionsInner.md) | A list with the dates and IDs of matching transactions. | [optional] |
| **missing_transaction_dates** | **Array&lt;Date&gt;** | A list of dates within the range of where a recurring transaction was expected but none was found. | [optional] |

## Example

```ruby
require 'lunchmoney-sdk-ruby'

instance = LunchMoney::RecurringObjectMatches.new(
  request_start_date: null,
  request_end_date: null,
  expected_occurrence_dates: null,
  found_transactions: null,
  missing_transaction_dates: null
)
```

