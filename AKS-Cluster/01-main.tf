# We will define 
# 1. Terraform Settings Block
# 1. Required Version Terraform
# 2. Required Terraform Providers
# 3. Terraform Remote State Storage with Azure Storage Account (last step of this section)
# 2. Terraform Provider Block for AzureRM
# 3. Terraform Resource Block: Define a Random Pet Resource

# 1. Terraform Settings Block
terraform {
  cloud {
    organization = "VortexLab"

    workspaces {
      name = "k8s-lab"
    }
  }
  # 1. Required Version Terraform
  required_version = ">= 1.0.0"
  # 2. Required Terraform Providers  
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.99"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 1.6"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }

  # # Uncomment the following if a cluster will be managed by multiple people
  # # Terraform State Storage to Azure Storage Container, must be created from UI first
  #   backend "azurerm" {
  #     resource_group_name   = "terraform-storage-rg"
  #     storage_account_name  = "terraformstatecharleli"
  #     container_name        = "tfstatefiles"
  #     key                   = "dev.terraform.tfstate"
  #   }  
}



# 2. Terraform Provider Block for AzureRM
provider "azurerm" {
  features {

  }
}

# 3. Terraform Resource Block: Define a Random Pet Resource
resource "random_pet" "aksrandom" {

}

