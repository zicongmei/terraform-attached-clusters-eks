#!/bin/bash
set -x

aws eks update-kubeconfig --region "$3" --name "$4"
gcloud container hub memberships unregister $1 --context=$2