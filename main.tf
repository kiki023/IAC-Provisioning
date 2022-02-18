terraform {
  required_version = ">= 0.13"

  required_providers {
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.7.0"
    }
  }

    random = {
      source  = "hashicorp/random"
      version = "3.0.0"
    }

    local = {
      source  = "hashicorp/local"
      version = "2.0.0"
    }

    null = {
      source  = "hashicorp/null"
      version = "3.0.0"
    }

    template = {
      source  = "hashicorp/template"
      version = ">=2.0.1"
    }
  }

  backend "s3" {
    bucket               = "dotpaystaging"
    region               = "us-west-1"
    key                  = "terraform.tfstate"
    dynamodb_table       = "dotpaydb"
  

  required_version = "~> 0.14"
  }
}
