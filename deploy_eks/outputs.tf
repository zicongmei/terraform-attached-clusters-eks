output "cluster_id" {
  description = "EKS cluster ID."
  value       = module.eks.cluster_id
}

output "cluster_endpoint" {
  description = "Endpoint for EKS control plane."
  value       = module.eks.cluster_endpoint
}

output "cluster_security_group_id" {
  description = "Security group ids attached to the cluster control plane."
  value       = module.eks.cluster_security_group_id
}


output "region" {
  description = "AWS region"
  value       = var.region
}

output "cluster_name" {
  description = "Kubernetes Cluster Name"
  value       = local.cluster_name
}

output "oidc_issuer_url" {
  value = module.eks.cluster_oidc_issuer_url
}


output "kubeconfig" {
  value = "aws eks update-kubeconfig --region ${var.region} --name ${local.cluster_name}"
}

output "k8s_token" {
  sensitive = true
  value = data.aws_eks_cluster_auth.cluster.token
}

output "k8s_ca" {
  sensitive = true
  value = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
}
#output "k8s_version" {
#  value = kubectl_server_version.current.version
#}

output "project_id" {
  value = var.project_id
}

output "admin_users" {
  value = var.admin_users
}
