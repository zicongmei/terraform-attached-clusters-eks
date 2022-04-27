



resource "kubernetes_namespace" "config-management-system" {
  metadata {
    name = "config-management-system"
  }
}

resource "kubernetes_secret" "git-creds" {
  metadata {
    name = "git-creds"
    namespace = kubernetes_namespace.config-management-system.metadata[0].name
  }

  data = {
    ssh = "${file("~/.ssh/id_rsa.pub")}"
  }

}