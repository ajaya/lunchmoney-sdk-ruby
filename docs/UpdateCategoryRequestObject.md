# LunchMoney::UpdateCategoryRequestObject

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **name** | **String** | If set, the new name of the category. Must be between 1 and 100 characters. | [optional] |
| **description** | **String** | If set, the new description of the category. Must not exceed 200 characters. | [optional] |
| **is_income** | **Boolean** | If set, will indicate if this category will be treated as income. (See &lt;a href&#x3D;\&quot;https://support.lunchmoney.app/setup/categories/category-properties\&quot;&gt;Category Properties&lt;/a&gt; for more details) | [optional] |
| **exclude_from_budget** | **Boolean** | If set, will indicate if this category will be excluded from budgets. (See &lt;a href&#x3D;\&quot;https://support.lunchmoney.app/setup/categories/category-properties\&quot;&gt;Category Properties&lt;/a&gt; for more details) | [optional] |
| **exclude_from_totals** | **Boolean** | If set, will indicate if this category will be excluded from totals. (See &lt;a href&#x3D;\&quot;https://support.lunchmoney.app/setup/categories/category-properties\&quot;&gt;Category Properties&lt;/a&gt; for more details) | [optional] |
| **archived** | **Boolean** | If set, will indicate if this category is archived. | [optional] |
| **group_id** | **Integer** | If set to the ID of an existing category group, and this category is not itself a category group, this category will be a child of the specified group. | [optional] |
| **is_group** | **Boolean** | This attribute may not be set to a value that is different than the current status of the category or category group. In other words, this API may not be used to convert a category to a category group or vice versa. | [optional][default to false] |
| **children** | [**Array&lt;CreateCategoryRequestObjectChildrenInner&gt;**](CreateCategoryRequestObjectChildrenInner.md) | The list of existing category objects, or existing category IDs or names of new categories to add to the new category group. This attribute should only be set if modifying an existing category group.&lt;br&gt; The categories or IDs specified must already exist and not belong to an existing category group. Categories that already belong to another category group will be moved. If strings are specified, they will be used as the names of new categories that will be added to the new category group. The request will fail if any names are the same as the name of an existing category.&lt;br&gt; It is permissible to provide both full category objects and IDs as well as strings for names in the same request. | [optional] |
| **order** | **Integer** | An index specifying the position in which the category is displayed on the categories page in the Lunch Money GUI. For categories within a category group the order is relative to the other categories within the group.&lt;br&gt;While this property can be set via the API it is generally set by the user in the Lunch Money GUI. API. | [optional] |
| **collapsed** | **Boolean** | If &#x60;true&#x60;, the category is collapsed in the Lunch Money GUI.&lt;br&gt;While this property can be set via the API it is generally set by the user in the Lunch Money GUI. | [optional] |
| **id** | **Integer** | System defined unique identifier for the category. Ignored if set. | [optional] |
| **archived_at** | **String** | System set date and time of when the category was last archived (in the ISO 8601 extended format). Ignored if set. | [optional] |
| **updated_at** | **Time** | System set date and time of when the category was last updated (in the ISO 8601 extended format). Ignored if set. | [optional] |
| **created_at** | **Time** | System set date and time of when the category was created (in the ISO 8601 extended format). Ignored if set. (in the ISO 8601 extended format). Ignored if set. | [optional] |

## Example

```ruby
require 'lunchmoney-sdk-ruby'

instance = LunchMoney::UpdateCategoryRequestObject.new(
  name: null,
  description: null,
  is_income: null,
  exclude_from_budget: null,
  exclude_from_totals: null,
  archived: null,
  group_id: null,
  is_group: null,
  children: null,
  order: null,
  collapsed: null,
  id: null,
  archived_at: null,
  updated_at: null,
  created_at: null
)
```

