terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.70"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.0.1"
    }
  }
  required_version = ">= 1.1.0"

  cloud {
    organization = "LoveChi"

    workspaces {
      name = "gh-actions-dotpay"
    }
  }
}

provider "aws" {
        region = "us-west-1"
        access_key = var.aws_access_key
	secret_key = var.aws_secret_access_key
}

resource "aws_instance" "ec2" {
    ami = "ami-054965c6cd7c6e462"
    instance_type = "t2.medium"
    tags = {
    Name = "testingDotPay"
    Envrionment = "production"
  }
}

