output "policy_assignment_ids" {
  value = [for k, v in azurerm_policy_assignment.mgmt_group_policy : v.id]
} 