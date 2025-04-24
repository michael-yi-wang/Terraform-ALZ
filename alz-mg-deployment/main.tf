terraform {
  required_providers {
    azapi = {
      source  = "Azure/azapi"
      version = "~> 2.2"
    }
    alz = {
      source  = "Azure/alz"
      version = "~> 0.17.4"
    }
    modtm = {
      source  = "Azure/modtm"
      version = "~> 0.3"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }

    time = {
      source  = "hashicorp/time"
      version = "~> 0.9"
    }
  }
}

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

provider "azapi" {}


# This allows us to get the tenant id
data "azapi_client_config" "current" {}

