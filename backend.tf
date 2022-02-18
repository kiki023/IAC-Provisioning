terraform {
  backend "s3" {
    
      bucket         = "dotpaystaging"
      key            = "s3/terraform.tfstate"
      region         = "us-west-1"

      dynamodb_table = "dotpaydB"
    
   }
   
  
  
   
  resource "aws_dynamodb_table" "terraform_statelock" {
    name = "${var.aws_dynamodb_table}"
    read_capacity = 20
    write_capacity = 20
    hash_key = "LockID"

  attribute {
      name = "LockID"
      type = "S"
    }
  }
}
