# LunchMoney::ManualAccountObject

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | The unique identifier of this account |  |
| **name** | **String** | Name of the account |  |
| **institution_name** | **String** | Name of institution holding the account |  |
| **display_name** | **String** | Optional display name for the account as set by the user or derived from the &#x60;institution_name&#x60; and &#x60;name&#x60; if not explicitly set. |  |
| **type** | [**AccountTypeEnum**](AccountTypeEnum.md) | Primary type of the account |  |
| **subtype** | **String** | Optional account subtype. Examples include&lt;br&gt; - retirement - checking - savings - prepaid credit card |  |
| **balance** | **String** | Current balance of the account in numeric format to 4 decimal places |  |
| **currency** | **String** | Three-letter lowercase currency code of the account balance |  |
| **to_base** | **Float** | The balance converted to the user&#39;s primary currency |  |
| **balance_as_of** | **Time** | Date balance was last updated in ISO 8601 extended format, can be in date or date-time format |  |
| **status** | **String** | The status of the account |  |
| **closed_on** | **Date** | The date this account was closed in YYYY-MM-DD format. Will be null if the account has not been marked as closed. |  |
| **external_id** | **String** | An optional external_id that may be set or updated via the API |  |
| **custom_metadata** | **Hash&lt;String, Object&gt;** | User defined JSON data that can be set or cleared via the API | [optional] |
| **exclude_from_transactions** | **Boolean** | If true, this account will not show up as an option for assignment when creating transactions manually | [default to false] |
| **created_by_name** | **String** | The name of the user who created the account |  |
| **created_at** | **Time** | Date/time the account was created in ISO 8601 extended format |  |
| **updated_at** | **Time** | Date/time the account was created in ISO 8601 extended format |  |

## Example

```ruby
require 'lunchmoney-sdk-ruby'

instance = LunchMoney::ManualAccountObject.new(
  id: null,
  name: null,
  institution_name: null,
  display_name: null,
  type: null,
  subtype: null,
  balance: null,
  currency: null,
  to_base: null,
  balance_as_of: null,
  status: null,
  closed_on: null,
  external_id: null,
  custom_metadata: null,
  exclude_from_transactions: null,
  created_by_name: null,
  created_at: null,
  updated_at: null
)
```

