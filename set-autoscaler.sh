#! /bin/bash

# INSTALL

# metrics-server
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
kubectl patch deployment metrics-server -n kube-system --type 'json' -p '[{"op": "add", "path": "/spec/template/spec/containers/0/args/-", "value": "--kubelet-insecure-tls"}]'

# apache bench
apt install apache2-utils



echo ""
echo ""
echo ""



# TEST

# metrics-server
kubectl top node
kubectl get apiservices |grep metrics

# apache bench
ab -v


# 部署my-scheduler，部署测试用rc
cat usages.txt