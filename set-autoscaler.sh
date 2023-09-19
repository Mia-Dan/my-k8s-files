#! /bin/bash

# INSTALL

# metrics-server
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
kubectl patch deployment metrics-server -n kube-system --type 'json' -p '[{"op": "add", "path": "/spec/template/spec/containers/0/args/-", "value": "--kubelet-insecure-tls"}]'

# apache bench
echo -e "Y\n" | apt install apache2-utils # auto answer the "Y/n" field to continue installing process


# TEST

# apache bench
ab -V

# metrics-server
sleep 60 # wait for some time, before patch comes into effect 
kubectl get apiservices |grep metrics


# EXAMPLES DOCS: 部署my-scheduler，部署测试用rc
cat usages.txt

