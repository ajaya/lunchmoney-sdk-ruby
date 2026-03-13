# LunchMoney::SummaryCategoryObject

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **category_id** | **Integer** | ID of the category associated with the totals. |  |
| **totals** | [**SummaryCategoryTotalsObject**](SummaryCategoryTotalsObject.md) |  |  |
| **occurrences** | [**Array&lt;SummaryCategoryOccurrenceObject&gt;**](SummaryCategoryOccurrenceObject.md) | A list of objects describing the budget activity for each period within the range. This property is only present when &#x60;include_occurrences&#x60; is true.&lt;p&gt; For aligned ranges, there is one occurrence for each budget period in the range; for non-aligned, only periods fully contained in the range are included.&lt;p&gt; If &#x60;include_past_budget_dates&#x60; is also &#x60;true&#x60;, the three budget periods prior to the range are also included. | [optional] |
| **rollover_pool** | [**SummaryRolloverPoolObject**](SummaryRolloverPoolObject.md) |  | [optional] |

## Example

```ruby
require 'lunchmoney-sdk-ruby'

instance = LunchMoney::SummaryCategoryObject.new(
  category_id: null,
  totals: null,
  occurrences: null,
  rollover_pool: null
)
```

