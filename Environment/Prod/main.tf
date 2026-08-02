module "azurerm_resource_group" {
    source = "../../Modules/azurerm_resource_group"
    rgs = var.rgs
  
}

module "vnet" {
    depends_on = [ module.azurerm_resource_group ]
    source = "../../Modules/virtual_network"
    vnet = var.vnet
  
}

module "subnet" {
    depends_on = [ module.vnet ]
    source = "../../Modules/azurerm_subnet"
    subnets = var.subnets
  
}

module "public_ip" {
    depends_on = [ module.azurerm_resource_group ]
    source = "../../Modules/public_ip"
    pips = var.pips
  
}

module "Network_interface" {
    depends_on = [ module.subnet,module.public_ip ]
    source = "../../Modules/Network_interface"
    nics = var.nics
  
}
module "azurerm_network_security_group" {
    depends_on = [ module.public_ip,module.subnet ]
    source = "../../Modules/Network_Security_Group"
    nsgs = var.nsgs
    
}

module "subnet_nsg_associations" {
    depends_on = [ module.azurerm_network_security_group ]
    source = "../../Modules/Nsg_associates_Subnets"
    Associated_nsgs= var.Associated_nsgs
  
}



module "Virtual_Machine" {
    depends_on = [ module.Network_interface ]
    source = "../../Modules/Virtual_Machines"
    vms = var.vms
  
}
