nics = {
    nic1 = {
      nic_name                = "frontend_nic"
      nic_location            = "centralindia"
      nic_rg                  = "ravi"
      subnet_name = "frontend_subnet"
      virtual_network_name = "prod-vnet"
      pip_name ="linux_pip" 
    }
}