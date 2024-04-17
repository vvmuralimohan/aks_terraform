resource "azurerm_virtual_network" "mainnetwork" {
  name                = "Vnet-LinuxRG"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.0.0.0/16"]
}

#build devsubnet and link to mainnetwork virtual network
resource "azurerm_subnet" "prodsubnet" {
  name                 = "prod-subnet-LinuxRG"
  resource_group_name  = azurerm_resource_group.rg.name
  address_prefixes     = ["10.0.1.0/24"]
  virtual_network_name = azurerm_virtual_network.mainnetwork.name
}

#build testsubnet and link to mainnetwork virtual network
resource "azurerm_subnet" "devsubnet" {
  name                 = "dev-subnet-LinuxRG"
  resource_group_name  = azurerm_resource_group.rg.name
  address_prefixes     = ["10.0.2.0/24"]
  virtual_network_name = azurerm_virtual_network.mainnetwork.name
}
