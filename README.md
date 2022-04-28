# Demo of using terraform to attach the cluster to GKE hub

# Deploy a EKS cluster

```bash
pushd deploy_eks
terrafrom init
terrafrom apply
terrafrom output
pushd
```

Cpoy the info from the `terraform output`

# Attach the GKE hub and install ACM

```bash
cd <root-dir-of-this-repo>
# modify the `terraform.tfvars`. Some info can be found from the output of 
#   previous `terraform output`
terrafrom init
terrafrom apply
```