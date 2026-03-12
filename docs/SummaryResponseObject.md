# LunchMoney::SummaryResponseObject

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **aligned** | **Boolean** | &#x60;true&#x60; if start_date and end_date are aligned with the user&#39;s budget period setting; &#x60;false&#x60; otherwise.&lt;p&gt; When the response is not aligned, category &#x60;totals&#x60; will not include values for the &#x60;budgeted&#x60; and &#x60;available&#x60; properties, so aligned responses are usually preferred.&lt;p&gt; If unsure how to set an aligned date range, set a range of at least one month and set the &#x60;include_occurrences&#x60; parameter to &#x60;true&#x60;. Then examine the objects in the &#x60;occurrences&#x60; array for the first category to find start and end dates that will produce aligned responses.  Setting &#x60;include_past_budget_dates&#x60; to &#x60;true&#x60; will add the three budget periods prior to the range in the &#x60;occurrences&#x60; array. |  |
| **categories** | [**Array&lt;SummaryCategoryObject&gt;**](SummaryCategoryObject.md) |  |  |
| **totals** | [**SummaryTotalsObject**](SummaryTotalsObject.md) |  | [optional] |
| **rollover_pool** | [**SummaryRolloverPoolObject**](SummaryRolloverPoolObject.md) |  | [optional] |

## Example

```ruby
require 'lunchmoney-sdk-ruby'

instance = LunchMoney::SummaryResponseObject.new(
  aligned: null,
  categories: null,
  totals: null,
  rollover_pool: null
)
```

