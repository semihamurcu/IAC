resource "azurerm_virtual_network" "main" {
  name                = "test-network"
  address_space       = ["10.0.0.0/16"]
  location            = "westeurope"
  resource_group_name = "S1203586"  # Hier vul je de naam van de bestaande resourcegroup in
}
