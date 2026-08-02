resource "azurerm_network_security_group" "nsg" {
    for_each = var.nsgs
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.rg


  security_rule {
    name                       = each.value.Security_name
    priority                   = each.value.priority
    direction                  = each.value.direction
    access                     = each.value.access
    protocol                   = each.value.protocol
    source_port_range          = each.value.SPR
    destination_port_ranges     = each.value.DPR
    source_address_prefix      = each.value.source_address_prefix
    destination_address_prefix = each.value.destination_address_prefix
  }
}