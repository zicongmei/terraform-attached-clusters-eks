# Demo of using terraform to attach the cluster to GKE hub

# Deploy a EKS cluster

```bash
pushd deploy_eks
terrafrom init
terrafrom apply
pushd
```

# Attach the GKE hub and install ACM

```bash
cd <root-dir-of-this-repo>
terrafrom init
terrafrom apply
```