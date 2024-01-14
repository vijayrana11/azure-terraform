resource "azurerm_resource_group" "myrg" {
    name = "terraform-automated-rg"
    location = "Central India"
    managed_by = "terraform-automation"
  
}