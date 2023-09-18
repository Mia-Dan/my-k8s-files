#! /bin/bash

echo ""
echo ""
echo "SETTING UP MY SCHEDULER"
echo ""
kubectl create -f my-sched.yaml
kubectl get po -n kube-system

kubectl edit clusterrole system:kube-scheduler
echo ""
echo ""

