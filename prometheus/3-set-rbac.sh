#! /bin/bash

kubectl apply -f 3-rbac/cluster-role.yaml
kubectl apply -f 3-rbac/service-account.yaml
kubectl apply -f 3-rbac/cluster-role-binding.yaml