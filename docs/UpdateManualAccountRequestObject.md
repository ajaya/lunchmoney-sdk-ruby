# LunchMoney::UpdateManualAccountRequestObject

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | System defined unique identifier of this account. Ignored if set | [optional] |
| **name** | **String** | If set, the new name of the manual account | [optional] |
| **institution_name** | **String** | If set, the name of institution holding the account | [optional] |
| **display_name** | **String** | If set, the new display name for the manual account.&lt;br&gt; This must be unique for the user. | [optional] |
| **type** | [**AccountTypeEnum**](AccountTypeEnum.md) | If set, the new type of the manual account | [optional] |
| **subtype** | **String** | If set, an optional account subtype. Examples include&lt;br&gt; - retirement - checking - savings - prepaid credit card | [optional] |
| **balance** | [**UpdateManualAccountRequestObjectBalance**](UpdateManualAccountRequestObjectBalance.md) |  | [optional] |
| **currency** | [**CurrencyEnum**](CurrencyEnum.md) | If set, the new three-letter lowercase currency code of the manual account balance. | [optional] |
| **balance_as_of** | **String** | A new date for the &#x60;updated_at&#x60; property. May be set as a date, ie: YYYY-MM-DD, or date-time string in ISO 8601 extended format. This property is ignored if &#x60;balance&#x60; is not also set. If &#x60;balance&#x60; is set and this property is not set the current time is used. | [optional] |
| **status** | **String** | If set, the status of the manual account. If set to &#x60;closed&#x60;, the &#x60;closed_on_date&#x60; date will be set to the current date, unless it is also set. | [optional] |
| **closed_on** | [**UpdateManualAccountRequestObjectClosedOn**](UpdateManualAccountRequestObjectClosedOn.md) |  | [optional] |
| **external_id** | **String** | An optional user-defined ID for the manual account | [optional] |
| **custom_metadata** | **Hash&lt;String, Object&gt;** | An optional JSON object that includes additional data related to this account. This must be a valid JSON object and, when stringified, must not exceed 4096 characters. | [optional] |
| **exclude_from_transactions** | **Boolean** | If set, transactions may not be assigned to this manual account | [optional] |
| **to_base** | **Float** | System defined balance converted to the user&#39;s primary currency. Ignored if set. Use &#x60;balance&#x60; to update the balance in the account | [optional] |
| **created_at** | **Time** | System defined date/time the account was created in ISO 8601 extended format. Ignored if set. | [optional] |
| **updated_at** | **Time** | System defined date/time the account was created in ISO 8601 extended format. Ignored if set. | [optional] |
| **created_by_name** | **String** | System defined name of the user who created the account. Ignored if set | [optional] |

## Example

```ruby
require 'lunchmoney-sdk-ruby'

instance = LunchMoney::UpdateManualAccountRequestObject.new(
  id: null,
  name: null,
  institution_name: null,
  display_name: null,
  type: null,
  subtype: null,
  balance: null,
  currency: null,
  balance_as_of: null,
  status: null,
  closed_on: null,
  external_id: null,
  custom_metadata: null,
  exclude_from_transactions: null,
  to_base: null,
  created_at: null,
  updated_at: null,
  created_by_name: null
)
```

