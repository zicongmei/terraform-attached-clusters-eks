
resource "google_gke_hub_membership" "membership" {
  membership_id = "hub-1"
  authority {
    issuer = module.eks.cluster_oidc_issuer_url
  }
  depends_on = [module.eks.cluster_oidc_issuer_url]
}