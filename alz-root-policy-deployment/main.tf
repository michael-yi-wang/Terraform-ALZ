provider "azurerm" {
  features {}
}

resource "azurerm_policy_assignment" "mgmt_group_policy" {
  for_each             = var.policy_assignments
  name                 = each.value.assignment_name
  scope                = each.value.management_group_id
  policy_definition_id = each.value.policy_definition_id
  description          = lookup(each.value, "description", null)
  display_name         = lookup(each.value, "display_name", null)
  enforcement_mode     = lookup(each.value, "enforcement_mode", null)
  parameters           = jsonencode(each.value.parameters)
}