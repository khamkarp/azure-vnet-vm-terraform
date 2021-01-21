resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_availability_set" "avs" {
  name                = "${local.prefix}-aset"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  managed             = true

  tags = {
    environment = terraform.workspace
  }
}

resource "azurerm_network_interface" "nic" {
  count               = var.vm_count
  name                = "${local.prefix}-${count.index}-nic"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "config1"
    subnet_id                     = azurerm_subnet.subnet[count.index].id
    private_ip_address_allocation = "Static"
  }
}
