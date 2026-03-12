# LunchMoney::SummaryApi

All URIs are relative to *https://api.lunchmoney.dev/v2*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**get_budget_summary**](SummaryApi.md#get_budget_summary) | **GET** /summary | Get summary |


## get_budget_summary

> <SummaryResponseObject> get_budget_summary(start_date, end_date, opts)

Get summary

Retrieves a summary of the user's budget. Use this endpoint to access budget configuration details and performance for a specified date range.<p> Use the [/budgets](#tag/budgets) endpoint to manage budget objects.

### Examples

```ruby
require 'time'
require 'lunchmoney-sdk-ruby'
# setup authorization
LunchMoney.configure do |config|
  # Configure API key authorization: cookieAuth
  config.api_key['_lm_access_token'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['_lm_access_token'] = 'Bearer'

  # Configure Bearer authorization (JWT): bearerSecurity
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = LunchMoney::SummaryApi.new
start_date = Date.parse('2025-07-01') # Date | Start of date range in ISO 8601 date format (YYYY-MM-DD).
end_date = Date.parse('2025-08-31') # Date | End of date range in ISO 8601 date format (YYYY-MM-DD).
opts = {
  include_exclude_from_budgets: true, # Boolean | Enable to include categories that have the 'Exclude from Budgets' flag set in the returned `categories` array.
  include_occurrences: true, # Boolean | Enable to include an `occurrences` array for each category in an aligned response. Each array will include an object for each budget period that falls within the specified date range which includes details on the activity for the budget period.
  include_past_budget_dates: true, # Boolean | Enable to include the three budget occurrences prior to the start date in the `occurrences` array for each category in an aligned response. This property is ignored if `include_occurrences` is not also set to `true`.
  include_totals: true, # Boolean | Enable to include a top-level `totals` section that summarizes the inflow and outflow across all transactions for the specified date range.
  include_rollover_pool: true # Boolean | Enable to include a `rollover_pool` section that summarizes the current rollover pool balance and all previous adjustments.
}

begin
  # Get summary
  result = api_instance.get_budget_summary(start_date, end_date, opts)
  p result
rescue LunchMoney::ApiError => e
  puts "Error when calling SummaryApi->get_budget_summary: #{e}"
end
```

#### Using the get_budget_summary_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<SummaryResponseObject>, Integer, Hash)> get_budget_summary_with_http_info(start_date, end_date, opts)

```ruby
begin
  # Get summary
  data, status_code, headers = api_instance.get_budget_summary_with_http_info(start_date, end_date, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SummaryResponseObject>
rescue LunchMoney::ApiError => e
  puts "Error when calling SummaryApi->get_budget_summary_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **start_date** | **Date** | Start of date range in ISO 8601 date format (YYYY-MM-DD). |  |
| **end_date** | **Date** | End of date range in ISO 8601 date format (YYYY-MM-DD). |  |
| **include_exclude_from_budgets** | **Boolean** | Enable to include categories that have the &#39;Exclude from Budgets&#39; flag set in the returned &#x60;categories&#x60; array. | [optional][default to false] |
| **include_occurrences** | **Boolean** | Enable to include an &#x60;occurrences&#x60; array for each category in an aligned response. Each array will include an object for each budget period that falls within the specified date range which includes details on the activity for the budget period. | [optional][default to false] |
| **include_past_budget_dates** | **Boolean** | Enable to include the three budget occurrences prior to the start date in the &#x60;occurrences&#x60; array for each category in an aligned response. This property is ignored if &#x60;include_occurrences&#x60; is not also set to &#x60;true&#x60;. | [optional][default to false] |
| **include_totals** | **Boolean** | Enable to include a top-level &#x60;totals&#x60; section that summarizes the inflow and outflow across all transactions for the specified date range. | [optional][default to false] |
| **include_rollover_pool** | **Boolean** | Enable to include a &#x60;rollover_pool&#x60; section that summarizes the current rollover pool balance and all previous adjustments. | [optional][default to false] |

### Return type

[**SummaryResponseObject**](SummaryResponseObject.md)

### Authorization

[cookieAuth](../README.md#cookieAuth), [bearerSecurity](../README.md#bearerSecurity)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

