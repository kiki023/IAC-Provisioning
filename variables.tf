# Variables Configuration
#

variable "cluster-name" {
  default = "dotpay-staging-demo"
  type    = string
}

variable "eks_node_instance_type" {
  default = "t2.medium"
}

# backend
bucket               = "dotpaystaging"
region               = "us-west-1"
key                  = "terraform.tfstate"
dynamodb_table       = "dotpaydb"

# deployment sub_domain
# deployments_subdomains = ["sample"]

# namespace
namespaces = ["dotpay-dev"]

