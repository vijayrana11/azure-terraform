resource "azurerm_resource_group" "myrg" {
    name = var.rgname
    location = var.location
    managed_by = local.managedby
  
}
