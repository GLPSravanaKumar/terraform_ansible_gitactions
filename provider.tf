terraform {
  required_providers {
    # This is the provider configuration for Terraform.
    # It specifies the providers and their versions that Terraform will use.
    mongodbatlas = {
      source  = "mongodb/mongodbatlas"
      version = "1.39.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.40.0"
    }
  }
}

provider "mongodbatlas" {

}

provider "aws" {
  region  = "ap-south-1"
  profile = "optum"
}

provider "azurerm" {
  features {}
}

