terraform {
  required_version = "~> 1.0" # which means any version equal & above 0.14 like 0.15, 0.16 etc and < 1.xx
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }


  backend "s3" {
     bucket               = "dotpaystaging"
      region              = "us-west-1"
      key                 = "terraform.tfstate"
      dynamodb_table      = "dotpaydb" 

 }
}

resource "aws_dynamodb_table" "tf_lock" {
  name = "dotpaydb"
  hash_key = "LockID"
  read_capacity = 3
  write_capacity = 3
  attribute {
     name = "LockID"
     type = "S"
   }
  tags = {
    Name = "Terraform Lock Table"
   }
   lifecycle {
   prevent_destroy = false
  }
 }



 # Provider Block
provider "aws" {
   region  = "us-west-1"
 }
