terraform {
  required_providers {
    azurerm = {
        source = "hashicoro/azurerm"
        version = "4.78.0"
    }
  }
}
provider "azurerm" {
    features {}
  
}