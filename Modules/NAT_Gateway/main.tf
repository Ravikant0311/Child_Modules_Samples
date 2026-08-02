data "azurerm_subnet" "subnet" {
  for_each = NAT_Gateway
  name = each.value.subnet_name
  resource_group_name = each.value.rg
  virtual_network_name = each.value.Vnet
  
}
data "azurerm_public_ip" "pip" {
  for_each = NAT_Gateway
  name = each.value.pip_name
  resource_group_name = each.value.rg
  
}

resource "azurerm_nat_gateway" "NAT" {
    for_each = NAT_Gateway
  name                = each.value.NAT_Gateway_name
  location            = each.value
  resource_group_name = each.value.rg
  sku_name            = "Standard"
}

resource "azurerm_nat_gateway_public_ip_association" "example" {
    for_each = NAT_Gateway
  nat_gateway_id       = resource.azurerm_nat_gateway.NAT.id
  public_ip_address_id = data.azurerm_public_ip[eack.key].pip
}


resource "azurerm_subnet_nat_gateway_association" "example" {
   for_each = NAT_Gateway
  subnet_id      = data.azurerm_subnet.subnet[eash.key].id
  nat_gateway_id = resource.azurerm_nat_gateway.NAT.id
}