#data "azurerm_subnet" "app" {
#  name                 = "app"
#  virtual_network_name = module.vnet.vnet_name
#  resource_group_name  = var.resource_group_name
#}

resource "azurerm_subnet" "subnet" {
  count                = length(var.subnet_names)
  name                 = var.subnet_names[count.index]
  resource_group_name  = var.resource_group_name
  address_prefixes     = [var.subnet_prefixes[count.index]]
  virtual_network_name = module.vnet.vnet_name
}
