data "aws_caller_identity" "current" {}

locals {
  account_id    = data.aws_caller_identity.current.account_id
  context       = "arn:aws:eks:${var.region}:${local.account_id}:cluster/${local.cluster_name}"
  membership_id = lower(local.cluster_name)
}

variable "project_id" {
  type = string
}

variable "admin_users" {
  type = string
}

module "cli" {
  source  = "terraform-google-modules/gcloud/google"
  version = "~> 2.0"

  platform              = "linux"
  additional_components = ["kubectl", "beta"]

  create_cmd_entrypoint = "${path.module}/scripts/register.sh"
  create_cmd_body       = "${local.membership_id} ${local.context} ${module.eks.cluster_oidc_issuer_url} ${var.region} ${var.admin_users} ${var.project_id} ${local.cluster_name}"

  destroy_cmd_entrypoint = "${path.module}/scripts/unregister.sh"
  destroy_cmd_body       = "${local.membership_id} ${local.context} ${var.region} ${local.cluster_name}"
}
