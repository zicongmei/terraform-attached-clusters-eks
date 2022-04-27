#!/bin/bash
set -x	

aws eks update-kubeconfig --region "$1" --name "$2"

gcloud container hub memberships register "$3" \
  --context="$4" \
  --enable-workload-identity \
  --public-issuer-url="$5"
