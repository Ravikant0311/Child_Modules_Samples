terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "4.78.0"

    }
  }
  backend "azurerm" {
    resource_group_name = "rg"
    storage_account_name = "mystorage"
    container_name = "tfstate"
    key = "dev.tfstate"
    
  }
}