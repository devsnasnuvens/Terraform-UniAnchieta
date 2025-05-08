terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.27.0"
    }
    azuread = {
      source = "hashicorp/azuread"
      version = "2.30.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "teste-tf"
    storage_account_name = "stgtfmzn01devdemo"
    container_name       = "tfstate"
    key                  = "tfnovo.tfstate"
    use_oidc = true
  }
}

provider "azurerm" {
  use_oidc = true
  features {}
}

provider "azuread" {
}

data "azurerm_client_config" "current" {}
