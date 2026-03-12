# LunchMoney::UpdateManualAccountRequestObjectClosedOn

## Class instance methods

### `openapi_one_of`

Returns the list of classes defined in oneOf.

#### Example

```ruby
require 'lunchmoney-sdk-ruby'

LunchMoney::UpdateManualAccountRequestObjectClosedOn.openapi_one_of
# =>
# [
#   :'Date',
#   :'Time'
# ]
```

### build

Find the appropriate object from the `openapi_one_of` list and casts the data into it.

#### Example

```ruby
require 'lunchmoney-sdk-ruby'

LunchMoney::UpdateManualAccountRequestObjectClosedOn.build(data)
# => #<Date:0x00007fdd4aab02a0>

LunchMoney::UpdateManualAccountRequestObjectClosedOn.build(data_that_doesnt_match)
# => nil
```

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| **data** | **Mixed** | data to be matched against the list of oneOf items |

#### Return type

- `Date`
- `Time`
- `nil` (if no type matches)

