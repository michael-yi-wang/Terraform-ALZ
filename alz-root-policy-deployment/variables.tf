variable "management_groups" {
  description = "List of management groups to assign policies to"
  type        = list(string)
}

variable "policy_assignments" {
  description = "Map of policy assignments"
  type = map(object({
    policy_definition_id = string
    management_group_id  = string
    parameters           = map(any)
    assignment_name      = string
    description          = optional(string)
    display_name         = optional(string)
    enforcement_mode     = optional(string)
  }))
} 