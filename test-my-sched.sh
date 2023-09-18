#! /bin/bash

kubectl create namespace my-test-space

sleep 10

echo ""
echo ""
echo "RUNNING TEST POD"
echo ""
kubectl create -f pod-test.yaml -n my-test-space
echo ""
echo "RUNNING TEST DEPLOYMENT"
echo ""
kubectl create -f deployment-test.yaml -n my-test-space
echo ""
kubectl get po -n my-test-space -o wide
echo ""
kubectl get po -n my-test-space
echo ""