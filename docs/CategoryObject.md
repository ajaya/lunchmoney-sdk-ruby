# LunchMoney::CategoryObject

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | System defined unique ID for the category |  |
| **name** | **String** | The name of the category. |  |
| **description** | **String** | The description of the category or &#x60;null&#x60; if not set. |  |
| **is_income** | **Boolean** | If &#x60;true&#x60;, the transactions in this category will be treated as income. (See &lt;a href&#x3D;\&quot;https://support.lunchmoney.app/setup/categories/category-properties\&quot;&gt;Category Properties&lt;/a&gt; for more details) |  |
| **exclude_from_budget** | **Boolean** | If &#x60;true&#x60;, the transactions in this category will be excluded from the budget. (See &lt;a href&#x3D;\&quot;https://support.lunchmoney.app/setup/categories/category-properties\&quot;&gt;Category Properties&lt;/a&gt; for more details) |  |
| **exclude_from_totals** | **Boolean** | If &#x60;true&#x60;, the transactions in this category will be excluded from totals. (See &lt;a href&#x3D;\&quot;https://support.lunchmoney.app/setup/categories/category-properties\&quot;&gt;Category Properties&lt;/a&gt; for more details) |  |
| **updated_at** | **Time** | The date and time of when the category was last updated (in the ISO 8601 extended format). |  |
| **created_at** | **Time** | The date and time of when the category was created (in the ISO 8601 extended format). |  |
| **group_id** | **Integer** | The ID of the category group this category belongs to or &#x60;null&#x60; if the category doesn&#39;t belong to a group, or is itself a category group. |  |
| **is_group** | **Boolean** | If &#x60;true&#x60;, the category is created as a category group. |  |
| **children** | [**Array&lt;ChildCategoryObject&gt;**](ChildCategoryObject.md) | For category groups, this will populate with details about the categories that belong to this group. The objects in this array are similar to Category Objects but do not include the &#x60;is_income&#x60;, &#x60;exclude_from_budget&#x60;, and &#x60;exclude_from_totals&#x60; properties as these are inherited from the category group. In addition, the &#x60;is_group&#x60; property will always be &#x60;false&#x60;, and there will be no &#x60;children&#x60; attribute. | [optional] |
| **archived** | **Boolean** | If true, the category is archived and not displayed in relevant areas of the Lunch Money app. |  |
| **archived_at** | **Time** | The date and time of when the category was last archived (in the ISO 8601 extended format). |  |
| **order** | **Integer** | An integer specifying the position in which the category is displayed on the categories page in the Lunch Money GUI. For categories within a category group the order is relative to the other categories within the group.&lt;br&gt;Categories with &#x60;order: null&#x60; will be displayed in alphabetical order by name, prior to any categories with an order |  |
| **collapsed** | **Boolean** | If &#x60;true&#x60;, the category is collapsed in the Lunch Money GUI. | [default to false] |

## Example

```ruby
require 'lunchmoney-sdk-ruby'

instance = LunchMoney::CategoryObject.new(
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
  children: null,
  archived: null,
  archived_at: null,
  order: null,
  collapsed: null
)
```

