# Define a provider in ireland region

provider "aws" {
  region = "eu-west-1"
  
}

# Define the terraform backend local
terraform {
    backend "local" {
        path = "terraform.tfstate"
    }
}