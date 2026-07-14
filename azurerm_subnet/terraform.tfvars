subnets = {
    snet1 = {
       name = "frontend_subnet"
    virtual_network_name= "prod-vnet"
    resource_group_name = "ravi"
    address_prefixes = ["10.0.1.0/24"]
 
    }
    snet2 = {
       name = "backent_subnet"
    virtual_network_name= "prod-vnet"
    resource_group_name = "ravi"
    address_prefixes = ["10.0.2.0/24"]
    }
 
}