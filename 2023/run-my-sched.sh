#! /bin/bash
cd ~/my-k8s-files

echo ""
echo ""
echo "SETTING UP MY SCHEDULER"
echo ""
sed -i "87s/<tag>/$1/g" my-sched.yaml
kubectl create -f my-sched.yaml
kubectl get po -n kube-system

kubectl edit clusterrole system:kube-scheduler
echo ""
echo ""


