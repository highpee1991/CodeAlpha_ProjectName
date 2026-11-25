terraform {
  backend "azurerm" {
    resource_group_name  = "rg-terraform-state"
    storage_account_name = "stcodealphatfstate"
    container_name       = "tfstate"
    key                  = "codealpha-project1.tfstate"

    use_azuread_auth = true
  }
}