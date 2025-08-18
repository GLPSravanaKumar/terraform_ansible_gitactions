resource "azurerm_resource_group" "grp_1" {
  name     = var.az_rgname1
  location = var.az_location1
}

resource "azurerm_resource_group" "grp_2" {
  name     = var.az_rgname2
  location = var.az_location2
}
