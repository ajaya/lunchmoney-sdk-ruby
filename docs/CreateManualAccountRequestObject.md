# LunchMoney::CreateManualAccountRequestObject

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **name** | **String** | Name of the manual account |  |
| **institution_name** | **String** | Name of institution holding the manual account | [optional] |
| **display_name** | **String** | Display name of the manual account as set by user or derived from the &#x60;institution_name&#x60; and &#x60;name&#x60; if not explicitly set.&lt;br&gt; This must be unique for the budgeting account. | [optional] |
| **type** | [**AccountTypeEnum**](AccountTypeEnum.md) | The type of manual account |  |
| **subtype** | **String** | An optional manual account subtype. Examples include&lt;br&gt; - retirement - checking - savings - prepaid credit card | [optional] |
| **balance** | [**CreateManualAccountRequestObjectBalance**](CreateManualAccountRequestObjectBalance.md) |  |  |
| **balance_as_of** | **String** | Date/time the balance of the manual account was last updated in ISO 8601 extended format | [optional] |
| **currency** | [**CurrencyEnum**](CurrencyEnum.md) | Three-letter lowercase currency code of the transaction in ISO 4217 format | [optional] |
| **status** | **String** | The status of the account | [optional][default to &#39;active&#39;] |
| **closed_on** | [**CreateManualAccountRequestObjectClosedOn**](CreateManualAccountRequestObjectClosedOn.md) |  | [optional] |
| **external_id** | **String** | An optional user-defined ID for the manual account | [optional] |
| **custom_metadata** | **Hash&lt;String, Object&gt;** | An optional JSON object that includes additional data related to this account. This must be a valid JSON object and, when stringified, must not exceed 4096 characters. | [optional] |
| **exclude_from_transactions** | **Boolean** | If &#x60;true&#x60;, transactions may not be assigned to this manual account | [optional][default to false] |

## Example

```ruby
require 'lunchmoney-sdk-ruby'

instance = LunchMoney::CreateManualAccountRequestObject.new(
  name: My Savings Account,
  institution_name: Bank of the West,
  display_name: Savings,
  type: null,
  subtype: prepaid credit card,
  balance: null,
  balance_as_of: 2024-09-15,
  currency: null,
  status: null,
  closed_on: null,
  external_id: null,
  custom_metadata: null,
  exclude_from_transactions: null
)
```

