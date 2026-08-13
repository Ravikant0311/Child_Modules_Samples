terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.80.0"
    }
  }
}

provider "azurerm" {
  features {}

  subscription_id = "6f86eca6-b83f-4894-ac69-1e5893305dc2"
  tenant_id       = "a7138af7-fb0c-43bf-81db-7f2458a2cd22"
}