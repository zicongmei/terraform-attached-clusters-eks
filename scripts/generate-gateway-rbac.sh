#!/bin/bash
set -x	

aws eks update-kubeconfig --region "$1" --name "$2"

gcloud alpha container hub memberships generate-gateway-rbac  \
--membership="$2" \
--role=clusterrole/cluster-admin \
--users="$3" \
--project="$4" \
--context="$5" \
--kubeconfig=~/.kube/config "$6" --verbosity=debug