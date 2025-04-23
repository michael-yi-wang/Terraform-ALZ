terraform {
  required_providers {
    azapi = {
      source  = "Azure/azapi"
      version = "~> 1.0.0"
    }
    alz = {
      source  = "Azure/alz"
      version = "~> 0.17.4"
    }
  }
}

# This allows us to get the tenant id
data "azapi_client_config" "current" {}

# Include the additional policies and override archetypes
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
