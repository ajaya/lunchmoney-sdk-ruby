# LunchMoney::RecurringObjectOverrides

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **payee** | **String** | If present, the payee name that will be displayed for any matching transactions. | [optional] |
| **notes** | **String** | If present, the notes that will be displayed for any matching transactions. | [optional] |
| **category_id** | **Integer** | If present, the ID of the category that matching transactions will be assigned to. | [optional] |

## Example

```ruby
require 'lunchmoney-sdk-ruby'

instance = LunchMoney::RecurringObjectOverrides.new(
  payee: null,
  notes: null,
  category_id: null
)
```

