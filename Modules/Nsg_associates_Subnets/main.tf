data "azurerm_subnet" "subnet" {
  for_each = var.Associated_nsgs
  name = each.value.subnet_name
  resource_group_name = each.value.rg
  virtual_network_name = each.value.Vnet
}
 
 data "azurerm_network_security_group" "nsg" {
    for_each = var.Associated_nsgs
  name                = each.value.nsg_name
  resource_group_name = each.value.rg
}

 resource "azurerm_subnet_network_security_group_association" "subnet_nsg_associations" {
    for_each = var.Associated_nsgs
  subnet_id                 = data.azurerm_subnet.subnet[each.key].id
  network_security_group_id = data.azurerm_network_security_group.nsg[each.key].id
}
