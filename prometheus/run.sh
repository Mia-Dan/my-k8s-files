#! /bin/bash

kubectl create namespace monitoring

./2-set-volume-4nfs.sh

./3-set-rbac.sh

kubectl apply -f 4-configmap/configmap.yaml 

kubectl apply -f 5-deploy-prometheus/deployment.yaml

kubectl apply -f 6-service/service.yaml