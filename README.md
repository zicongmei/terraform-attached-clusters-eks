# Provision an EKS cluster and register with Fleet

## Usage

1. Specify a Google Cloud project and an admin users.

```
cat > terraform.tfvars << EOF
project_id  = "$(gcloud config get-value project)"
admin_users = "$(gcloud config get-value account)"
EOF
```

2. Init and apply the Terraform config.

```
terraform init
terraform apply
```
