# Variables Configuration


variable "cluster-name" {
  default = "dotpay-staging-demo"
  type    = string
}

variable "key_pair_name" {
  default = "poy"
}

variable "eks_node_instance_type" {
  default = "t2.medium"
}

variable "aws_dynamodb_table" {
  default = "dotpaydB"
}



