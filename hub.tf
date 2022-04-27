
#resource "google_gke_hub_membership" "membership" {
#  membership_id = local.cluster_name
#  authority {
#    issuer = module.eks.cluster_oidc_issuer_url
#  }
#  depends_on = [module.eks.cluster_oidc_issuer_url]
#}