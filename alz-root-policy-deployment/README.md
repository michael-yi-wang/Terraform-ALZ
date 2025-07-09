# Azure Policy Assignment to Management Groups (ALZ Best Practice)

This Terraform configuration enables you to assign Azure Policies to management groups, following Azure Landing Zone (ALZ) best practices. Policy assignments are fully parameterized and can be managed via `terraform.tfvars`.

## Features
- Assign built-in or custom Azure Policies to one or more management groups
- Parameterize all assignment details (policy, parameters, display name, etc.)
- Easily extendable for additional policies or management groups

## File Structure
- `main.tf` – Core logic for policy assignment
- `variables.tf` – Input variable definitions
- `terraform.tfvars` – Example input values (edit this for your environment)
- `outputs.tf` – Outputs for created policy assignments

## Prerequisites
- [Terraform](https://www.terraform.io/downloads.html) >= 1.0
- Azure CLI or other authentication method for the `azurerm` provider
- Sufficient permissions to assign policies at the management group level

## Usage

1. **Clone the repository and navigate to this directory:**
   ```sh
   cd Terraform-ALZ/alz-root-policy-deployment
   ```

2. **Edit `terraform.tfvars`**
   - Specify your management group IDs in `management_groups`.
   - Define your policy assignments in the `policy_assignments` map. Each entry should include:
     - `policy_definition_id`: The resource ID of the policy definition (built-in or custom)
     - `management_group_id`: The resource ID of the management group
     - `assignment_name`: A unique name for the assignment
     - `parameters`: (Optional) Policy parameters as a map
     - `description`, `display_name`, `enforcement_mode`: (Optional) Additional assignment details

   Example:
   ```hcl
   management_groups = [
     "/providers/Microsoft.Management/managementGroups/alz-root",
     "/providers/Microsoft.Management/managementGroups/alz-landingzones"
   ]

   policy_assignments = {
     "audit-vm-agent" = {
       policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/abcd1234"
       management_group_id  = "/providers/Microsoft.Management/managementGroups/alz-root"
       assignment_name      = "AuditVMAgent"
       description          = "Audit VM Agent on all VMs"
       display_name         = "Audit VM Agent"
       enforcement_mode     = "Default"
       parameters           = {
         effect = "Audit"
       }
     }
   }
   ```

3. **Initialize Terraform:**
   ```sh
   terraform init
   ```

4. **Review the plan:**
   ```sh
   terraform plan
   ```

5. **Apply the configuration:**
   ```sh
   terraform apply
   ```

## Custom Policy Definitions
If you need to create custom policy definitions, add `azurerm_policy_definition` resources in `main.tf` and reference their IDs in your `policy_assignments`.

## Outputs
- `policy_assignment_ids`: List of resource IDs for the created policy assignments.

## References
- [Azure Landing Zone Documentation](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/landing-zones/)
- [Terraform AzureRM Provider](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)
- [Azure Policy Documentation](https://learn.microsoft.com/en-us/azure/governance/policy/overview)

---

**Customize `terraform.tfvars` to match your environment and policy requirements.**
