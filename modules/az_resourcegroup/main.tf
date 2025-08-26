resource "azurerm_resource_group" "grp_1" {
  name     = var.az_rgname1
  location = lower(var.az_location1)
}

resource "azurerm_resource_group" "grp_2" {
  name = var.az_rgname2
  # If var.a_L2 is an empty string then the result is "var.a_L1", but otherwise it is the actual value of var.a_L2.
  location = var.az_location2 == "" ? lower(var.az_location1) : var.az_location2
}
