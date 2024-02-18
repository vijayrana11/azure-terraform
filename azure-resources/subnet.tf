resource "azurerm_subnet" "mysubnet" {
    name = var.subnet_name
    resource_group_name = azurerm_resource_group.myrg.name
    virtual_network_name = azurerm_virtual_network.myvnet.name
    address_prefixes = ["192.168.0.64/24"]
    

  
}

# resource "azurerm_subnet" "example" {
#   name                 = "example-subnet"
#   resource_group_name  = azurerm_resource_group.example.name
#   virtual_network_name = azurerm_virtual_network.example.name
#   address_prefixes     = ["10.0.1.0/24"]

#   delegation {
#     name = "delegation"

#     service_delegation {
#       name    = "Microsoft.ContainerInstance/containerGroups"
#       actions = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action"]
#     }
#   }
# }