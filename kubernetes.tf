#provider "kubernetes" {
#  host                   = "${var.cluster_endpoint}"
#  token                  = var.k8s_token
#  cluster_ca_certificate = var.k8s_ca
#}

provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = local.context
}