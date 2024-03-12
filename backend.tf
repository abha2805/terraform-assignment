terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate-7054-RG"
    storage_account_name = "tfstate7054sa"
    container_name       = "tfstatefiles"
    key                  = "terraform.tfstate"
  }
}

