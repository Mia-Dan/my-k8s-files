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

# SUPPOSE deployment-test.yaml contains deployment `php-apache`
kubectl autoscale deployment php-apache --min=1 --max=8 --cpu-percent=10 
echo ""
kubectl get po -n my-test-space
echo ""
kubectl get hpa php-apache --watch
