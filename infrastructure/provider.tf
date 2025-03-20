terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.4.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "4497d15e-2307-44e9-8982-597e404ce799"
}
