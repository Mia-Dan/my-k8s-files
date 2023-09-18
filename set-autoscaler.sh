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
#   sleep 30
#   kubectl top node
#   kubectl get apiservices |grep metrics
# which doesn't work, and will return: 
#   error: Metrics API not available
#   v1beta1.metrics.k8s.io                 kube-system/metrics-server   False (MissingEndpoints)   28s
# no matter how long it `sleep`s

# apache bench
ab -V


# 部署my-scheduler，部署测试用rc
cat usages.txt

echo "-------------1"
kubectl get apiservices |grep metrics

echo "---"
echo "run TESTs for metrics-server:"
echo "kubectl get apiservices |grep metrics"

echo "-------------2"
./test-metrics-server.sh