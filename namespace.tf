variable "namespaces" {
  type        = list(string)
  description = "List of namespaces to be created in our EKS Cluster."
  default     = "dotpaystaging"
}

resource "kubernetes_namespace" "eks_namespaces" {
  for_each = toset(var.namespaces)

  metadata {
    annotations = {
      name = each.key
    }
    name = each.key
  }
}
