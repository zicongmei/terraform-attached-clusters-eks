#!/bin/bash
set -x	
aws eks update-kubeconfig --region "$4" --name "$7"

gcloud alpha container hub memberships generate-gateway-rbac  \
--membership="$1" \
--role=clusterrole/cluster-admin \
--users="$5" \
--project="$6" \
--context="$2" \
--kubeconfig="~/.kube/config" \
--apply

gcloud container hub memberships register "$1" \
  --context="$2" \
  --enable-workload-identity \
  --public-issuer-url="$3"