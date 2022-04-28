
#resource "google_gke_hub_membership" "membership" {
#  membership_id = local.cluster_name
#  authority {
#    issuer = module.eks.cluster_oidc_issuer_url
#  }
#  depends_on = [module.eks.cluster_oidc_issuer_url]
#}


module "cli" {
  source  = "terraform-google-modules/gcloud/google"
  version = "~> 2.0"

  platform              = "linux"
  additional_components = ["kubectl", "beta"]

  create_cmd_entrypoint = "${path.module}/scripts/register.sh"
  create_cmd_body       = "${local.membership_id} ${local.context} ${var.oidc_issuer_url} ${var.region} ${var.admin_users} ${var.project_id} ${var.cluster_name}"

  destroy_cmd_entrypoint = "${path.module}/scripts/unregister.sh"
  destroy_cmd_body       = "${local.membership_id} ${local.context} ${var.region} ${var.cluster_name}"

}
