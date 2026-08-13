rgs = {
  rg1 = {
    name     = "ravi"
    location = "centralindia"
  }
}

vnet = {
  vnet1 = {
    name                = "prod-vnet"
    location            = "centralindia"
    resource_group_name = "ravi"
    address_space       = ["10.0.0.0/16"]
  }
}

subnets = {
  snet1 = {
    name                 = "frontend_subnet"
    virtual_network_name = "prod-vnet"
    resource_group_name  = "ravi"
    address_prefixes     = ["10.0.1.0/24"]

  }
  snet2 = {
    name                 = "backend_subnet"
    virtual_network_name = "prod-vnet"
    resource_group_name  = "ravi"
    address_prefixes     = ["10.0.2.0/24"]
  }

}

pips = {
  pip1 = {
    name                = "frontend_pip"
    resource_group_name = "ravi"
    location            = "centralindia"
    allocation_method   = "Static"


  }
  pip2 = {
    name                = "backend_pip"
    resource_group_name = "ravi"
    location            = "centralindia"
    allocation_method   = "Static"
  }
}

nics = {
  nic1 = {
    nic_name             = "frontend_nic"
    nic_location         = "centralindia"
    nic_rg               = "ravi"
    subnet_name          = "frontend_subnet"
    virtual_network_name = "prod-vnet"
    pip_name             = "frontend_pip"
  }
  nic2 = {
    nic_name             = "backend_nic"
    nic_location         = "centralindia"
    nic_rg               = "ravi"
    subnet_name          = "backend_subnet"
    virtual_network_name = "prod-vnet"
    pip_name             = "backend_pip"
  }
}

vms = {
  vm1 = {
    nicname  = "frontend_nic"
    rg       = "ravi"
    name     = "frontend-vm"
    location = "centralindia"
    username = "Chunnu311"
    password = "Chunnu@03111990"

  }
  vm2 = {
    nicname  = "backend_nic"
    rg       = "ravi"
    name     = "backend-vm"
    location = "centralindia"
    username = "Chunnu311"
    password = "Chunnu@03111990"

  }
}

nsgs = {
  nsg1 = {



    name     = "NSG"
    location = "centralindia"
    rg       = "ravi"

    Security_name              = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    SPR                        = "*"
    DPR                        = ["22", "80"]
    source_address_prefix      = "*"
    destination_address_prefix = "*"

  }

}

Associated_nsgs = {
  nsg1 = {
    subnet_name = "frontend_subnet"
    rg          = "centralindia"
    Vnet        = "prod-vnet"
    nsg_name    = "NSG"
  }
  nsg2 = {
    subnet_name = "Backend_subnet"
    rg          = "centralindia"
    Vnet        = "prod-vnet"
    nsg_name    = "NSG"
  }
}


