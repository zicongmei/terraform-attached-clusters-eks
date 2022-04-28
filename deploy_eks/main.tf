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
