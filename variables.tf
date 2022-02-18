# Variables Configuration


variable "cluster-name" {
  default = "dotpay-staging-demo"
  type    = string
}

variable "key_pair_name" {
  default = "2022"
}

variable "eks_node_instance_type" {
  default = "t2.medium"
}


# deployment sub_domain
# deployments_subdomains = ["sample"]

# namespace
namespaces = "dotpay-staging"

