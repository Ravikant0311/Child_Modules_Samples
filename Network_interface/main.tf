data "azurerm_subnet" "subnet" {
  for_each = var.nics
  name = each.value.subnet_name
  resource_group_name = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
  
}
data "azurerm_public_ip" "pip" {
  for_each = var.nics
  name = each.value.pip_name
  resource_group_name = each.value.resource_group_name
  
}

resource "azurerm_network_interface" "nic" {
    for_each = var.nics
  name                = each.value.nic_name
  location            = each.value.nic_location
  resource_group_name = each.value.nic_rg

  ip_configuration {
    name                          = "internal"
    subnet_id                     = each.value.nic_subnet_id
    public_ip_address_id = each.value.nic_pip
    private_ip_address_allocation = "Dynamic"
  }
}
