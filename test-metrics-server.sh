#! /bin/bash
sleep 60
kubectl get apiservices |grep metrics
kubectl top node