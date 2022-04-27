#!/bin/bash
set -x	

aws eks update-kubeconfig --region "$1" --name "$2"

gcloud alpha container hub memberships generate-gateway-rbac  \
--membership="$3" \
--role=clusterrole/cluster-admin \
--users="$4" \
--project="$5" \
--context="$6" \
--kubeconfig=~/.kube/config "$7" --verbosity=debug