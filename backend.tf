terraform {
  backend "azurerm" {
    resource_group_name   = "c2c-demo"
    storage_account_name  = "tfc2c"
    container_name        = "tfbackend"
    key                   = "tfstate-file"
  }
}