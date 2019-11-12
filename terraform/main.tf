# Using a single workspace:
terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "berchevorg"

   workspaces {
      name = "filesystem-error" # workspace qualifier
    }
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = replace(var.environment, "stage", "dev") # remaps stage to use dev network
}

locals {
  full_service_name = "${var.service_name}-${var.environment}"

  tags = {
    environment  = var.environment
    terraform    = true
    domain       = var.domain
    service_name = var.service_name
  }
}

# Load VPC Data Source
#data "terraform_remote_state" "vpc" {
#  backend = "remote"

#  config = {
#    organization = "deo"
#    workspaces = {
#      name = "networking-${replace(var.environment, "stage", "dev")}" # remaps stage to use dev network
#    }
#  }
#}

# Get current account id that terraform is running under
data "aws_caller_identity" "current" {
}

