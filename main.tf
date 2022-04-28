data "aws_caller_identity" "current" {}

locals {
  account_id    = data.aws_caller_identity.current.account_id
  context       = "arn:aws:eks:${var.region}:${local.account_id}:cluster/${var.cluster_name}"
  membership_id = lower(var.cluster_name)
}

variable "cluster_name" {
  type = string
}

variable "region" {
  default     = "us-west-2"
  description = "AWS region"
}

variable "cluster_endpoint" {
  type = string
}

variable "k8s_token" {
  type = string
}

variable "k8s_ca" {
  type = string
}

variable "oidc_issuer_url" {
  type = string
}

variable "project_id" {
  type = string
}

variable "admin_users" {
  type = string
}

variable "sync_repo" {}
variable "sync_branch" {}
variable "policy_dir" {}
variable "secret_type" {}
