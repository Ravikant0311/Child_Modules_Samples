nics = {
    nic1 = {
      nic_name                = "frontend_nic"
      nic_location            = "centralindia"
      nic_rg                  = "ravi"
      subnet_name = "frontend_subnet"
      virtual_network_name = "prod-vnet"
      pip_name ="frontend_pip" 
    }
    nic2 = {
      nic_name                = "backend_nic"
      nic_location            = "centralindia"
      nic_rg                  = "ravi"
      subnet_name = "backend_subnet"
      virtual_network_name = "prod-vnet"
      pip_name ="backend_pip" 
    }
}