# LunchMoney::CreateCategoryRequestObject

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **name** | **String** | The name of the new category. Must be between 1 and 100 characters. Must not match the name of any existing categories or category groups. |  |
| **description** | **String** | The description of the category. Must not exceed 200 characters. | [optional] |
| **is_income** | **Boolean** | If &#x60;true&#x60;, the transactions in this category will be treated as income. (See &lt;a href&#x3D;\&quot;https://support.lunchmoney.app/setup/categories/category-properties\&quot;&gt;Category Properties&lt;/a&gt; for more details) | [optional][default to false] |
| **exclude_from_budget** | **Boolean** | If &#x60;true&#x60;, the transactions in this category will be excluded from the budget. (See &lt;a href&#x3D;\&quot;https://support.lunchmoney.app/setup/categories/category-properties\&quot;&gt;Category Properties&lt;/a&gt; for more details) | [optional][default to false] |
| **exclude_from_totals** | **Boolean** | If &#x60;true&#x60;, the transactions in this category will be excluded from totals. (See &lt;a href&#x3D;\&quot;https://support.lunchmoney.app/setup/categories/category-properties\&quot;&gt;Category Properties&lt;/a&gt; for more details) | [optional][default to false] |
| **is_group** | **Boolean** | If &#x60;true&#x60;, the category is created as a category group. | [optional][default to false] |
| **group_id** | **Integer** | If set to the ID of an existing category group, this new category will be assigned to that group. Cannot be set if &#x60;is_group&#x60; is true. | [optional] |
| **archived** | **Boolean** | If &#x60;true&#x60;, the category is archived and not displayed in relevant areas of the Lunch Money app. | [optional][default to false] |
| **children** | [**Array&lt;CreateCategoryRequestObjectChildrenInner&gt;**](CreateCategoryRequestObjectChildrenInner.md) | The list of existing category objects, or existing category IDs or names of new categories to add to the new category group. This attribute should only be set if &#x60;is_group&#x60; is also set to true.&lt;br&gt; The categories or IDs specified must already exist and may not be category groups themselves. Categories that already belong to another category group will be moved. If strings are specified, they will be used as the names of new categories that will be added to the new category group. The request will fail if any names are the same as the name of an existing category.&lt;br&gt; It is permissible to provide both full category objects and IDs as well as strings for names in the same request. | [optional] |
| **order** | **Integer** | An index specifying the position in which the category is displayed on the categories page in the Lunch Money GUI. For categories within a category group the order is relative to the other categories within the group.&lt;br&gt;While this property can be set via the API it is generally set by the user in the Lunch Money GUI. API. | [optional] |
| **collapsed** | **Boolean** | If &#x60;true&#x60;, the category is collapsed in the Lunch Money GUI.&lt;br&gt;While this property can be set via the API it is generally set by the user in the Lunch Money GUI. | [optional] |

## Example

```ruby
require 'lunchmoney-sdk-ruby'

instance = LunchMoney::CreateCategoryRequestObject.new(
  name: null,
  description: null,
  is_income: null,
  exclude_from_budget: null,
  exclude_from_totals: null,
  is_group: null,
  group_id: null,
  archived: null,
  children: null,
  order: null,
  collapsed: null
)
```

