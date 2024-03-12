terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate-7054-RG"
    storage_account_name = "tfstate7054sa"
    container_name       = "tfstatefiles"
    key                  = "terraform.tfstate"
    access_key           = "E3e4BpVea12CzQsqIRyPUihgLVtUbl/YplAKfkcs52dQCY+WO+dyH4ynC9Y8XQB8Lp8dYlMo7qj2+AStaIqrkA=="
  }
}

