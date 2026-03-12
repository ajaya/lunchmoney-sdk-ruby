# LunchMoney::DeleteTagResponseWithDependenciesDependents

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **rules** | **Integer** | The number of rules depending on the tag |  |
| **transactions** | **Integer** | The number of transactions with the tag |  |

## Example

```ruby
require 'lunchmoney-sdk-ruby'

instance = LunchMoney::DeleteTagResponseWithDependenciesDependents.new(
  rules: null,
  transactions: null
)
```

