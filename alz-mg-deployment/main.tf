provider "azurerm" {
      features {}
}

# Define the root management group
resource "azurerm_management_group" "root" {
      display_name = "Root Management Group"
      name         = "alz-root"
}

# Define the landing zone management group
resource "azurerm_management_group" "landing_zone" {
      display_name = "Landing Zone"
      name         = "alz-landing-zone"
      parent_management_group_id = azurerm_management_group.root.id
}

# Define the platform management group
resource "azurerm_management_group" "platform" {
      display_name = "Platform"
      name         = "alz-platform"
      parent_management_group_id = azurerm_management_group.root.id
}

# Define the connectivity management group
resource "azurerm_management_group" "connectivity" {
      display_name = "Connectivity"
      name         = "alz-connectivity"
      parent_management_group_id = azurerm_management_group.platform.id
}

# Define the identity management group
resource "azurerm_management_group" "identity" {
      display_name = "Identity"
      name         = "alz-identity"
      parent_management_group_id = azurerm_management_group.platform.id
}

# Define the management group for a specific subscription
resource "azurerm_management_group" "sandbox" {
      display_name = "Sandbox"
      name         = "alz-sandbox"
      parent_management_group_id = azurerm_management_group.landing_zone.id
}