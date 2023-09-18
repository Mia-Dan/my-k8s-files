#! /bin/bash

# INSTALL

# metrics-server
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
kubectl patch deployment metrics-server -n kube-system --type 'json' -p '[{"op": "add", "path": "/spec/template/spec/containers/0/args/-", "value": "--kubelet-insecure-tls"}]'

# apache bench
apt install apache2-utils
# 中间会有个回复Y/n的地方，试试如何避免abort（先开始的commit是可以的，后来会abort）
# 在执行本脚本时，`./set-autoscaler.sh`直接在terminal中回车，不要在它后面同时（一次性）复制其他cmd

# apache bench
ab -V

# metrics-server
sleep 60 # wait for some time, before patch comes into effect 
kubectl get apiservices |grep metrics


# 部署my-scheduler，部署测试用rc
cat usages.txt

