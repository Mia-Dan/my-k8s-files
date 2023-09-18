#! /bin/bash

echo ""
echo ""
echo "RUNNING TEST POD"
echo ""
kubectl create -f pod-test.yaml
kubectl get po


echo ""
echo ""
echo "RUNNING TEST DEPLOYMENT"
echo ""
kubectl create -f deployment-test.yaml
kubectl get po
