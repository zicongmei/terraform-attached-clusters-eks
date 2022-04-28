#!/bin/bash
set -x	

aws eks update-kubeconfig --region "$1" --name "$2"

gcloud container hub memberships register "$2" \
  --context="$3" \
  --enable-workload-identity \
  --public-issuer-url="$4"
