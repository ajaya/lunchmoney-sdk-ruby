# LunchMoney::ChildCategoryObject

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | A system defined unique identifier for the category. |  |
| **name** | **String** | The name of the category. |  |
| **description** | **String** | The description of the category or &#x60;null&#x60; if not set. |  |
| **is_income** | **Boolean** | If true, the transactions in this category will be treated as income. Inherited from Category Group. |  |
| **exclude_from_budget** | **Boolean** | If true, the transactions in this category will be excluded from the budget. Inherited from Category Group. |  |
| **exclude_from_totals** | **Boolean** | If true, the transactions in this category will be excluded from totals. Inherited from Category Group. |  |
| **updated_at** | **Time** | The date and time of when the category was last updated (in the ISO 8601 extended format). |  |
| **created_at** | **Time** | The date and time of when the category was created (in the ISO 8601 extended format). |  |
| **group_id** | **Integer** | The ID of the category group this category belongs to or &#x60;null&#x60; if the category doesn&#39;t belong to a group, or is itself a category group. |  |
| **is_group** | **Boolean** | Will always be false for a category that is part of category group. |  |
| **archived** | **Boolean** | If true, the category is archived and not displayed in relevant areas of the Lunch Money app. |  |
| **archived_at** | **Time** | The date and time of when the category was last archived (in the ISO 8601 extended format). |  |
| **order** | **Integer** | An index specifying the position in which the category is displayed on the categories page in the Lunch Money GUI. For categories within a category group the order is relative to the other categories within the group.&lt;br&gt; API. |  |
| **collapsed** | **Boolean** | If &#x60;true&#x60;, the category is collapsed in the Lunch Money GUI. | [optional] |

## Example

```ruby
require 'lunchmoney-sdk-ruby'

instance = LunchMoney::ChildCategoryObject.new(
  id: null,
  name: null,
  description: null,
  is_income: null,
  exclude_from_budget: null,
  exclude_from_totals: null,
  updated_at: null,
  created_at: null,
  group_id: null,
  is_group: null,
  archived: null,
  archived_at: null,
  order: null,
  collapsed: null
)
```

