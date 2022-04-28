
resource "kubernetes_namespace" "config-management-system" {
  metadata {
    name = "config-management-system"
  }
  depends_on = [module.cli]
}


provider "google-beta" {
  project     = var.project_id
  region      = "us-central1"
}

#resource "google_gke_hub_feature" "feature" {
#  name     = "configmanagement"
#  location = "global"
#  provider = google-beta
#}

resource "google_gke_hub_feature_membership" "feature_member" {
  location   = "global"
  feature    = "configmanagement"
  membership = local.membership_id
  configmanagement {
    #version = "1.8.0"
    config_sync {
      git {
        sync_repo   = var.sync_repo
        sync_branch = var.sync_branch
        policy_dir  = var.policy_dir
        secret_type = var.secret_type
      }
    }
  }
  provider = google-beta
  depends_on = [kubernetes_namespace.config-management-system]
}