terraform {
  required_providers {
    alz = {
      source  = "Azure/alz"
      version = "~> 0.17.4"
    }
  }
}

provider "alz" {
  library_overwrite_enabled = true
  library_references = [
    {
      path = "platform/alz",
      ref  = "2025.02.0"
    },
    {
      custom_url = "${path.root}/lib"
    }
  ]
}

# Deploy the recommended ALZ management group hierarchy
module "alz_management_groups" {
  source  = "Azure/alz/azurerm//modules/management_groups"
  version = "~> 0.17.4"

  root_management_group_id = "alz-root"
  root_management_group_display_name = "ALZ Root"

  platform_management_group_id = "platform"
  platform_management_group_display_name = "Platform"

  landing_zones_management_group_id = "landing-zones"
  landing_zones_management_group_display_name = "Landing Zones"

  identity_management_group_id = "identity"
  identity_management_group_display_name = "Identity"

  connectivity_management_group_id = "connectivity"
  connectivity_management_group_display_name = "Connectivity"

  management_management_group_id = "management"
  management_management_group_display_name = "Management"

  corp_management_group_id = "corp"
  corp_management_group_display_name = "Corp"

  online_management_group_id = "online"
  online_management_group_display_name = "Online"
}

output "root_management_group_id" {
  value = module.alz_management_groups.root_management_group_id
}
output "platform_management_group_id" {
  value = module.alz_management_groups.platform_management_group_id
}
output "landing_zones_management_group_id" {
  value = module.alz_management_groups.landing_zones_management_group_id
}
output "identity_management_group_id" {
  value = module.alz_management_groups.identity_management_group_id
}
output "connectivity_management_group_id" {
  value = module.alz_management_groups.connectivity_management_group_id
}
output "management_management_group_id" {
  value = module.alz_management_groups.management_management_group_id
}
output "corp_management_group_id" {
  value = module.alz_management_groups.corp_management_group_id
}
output "online_management_group_id" {
  value = module.alz_management_groups.online_management_group_id
}

