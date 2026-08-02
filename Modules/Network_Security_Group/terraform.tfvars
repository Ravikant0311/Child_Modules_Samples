nsgs = {
    nsg1 = {

    

        name                = "NSG"
        location            = "centralindia"
        resource_group_name = "ravi"

        Security_name                       = "test123"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        SPR                        = "*"
        DPR                        = ["22","80"]
        source_address_prefix      = "*"
        destination_address_prefix = "*"

    }
    
}    