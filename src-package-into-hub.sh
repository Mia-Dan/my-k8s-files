#! /bin/bash
cd ~/go/src/k8s.io/kubernetes

# 按k8s的文件夹中的makefile编译 -> binary
KUBE_BUILD_PLATFORMS=linux/amd64 make WHAT=cmd/kube-scheduler GOFLAGS=-v GOGCFLAGS="-N -l" -j4

# 现在binary build好了，要上传docker了
touch Dockerfile
echo "FROM busybox">>Dockerfile
echo "ADD ./_output/local/bin/linux/amd64/kube-scheduler /usr/local/bin/kube-scheduler">>Dockerfile

docker build -t miadan/my-kube-scheduler:$3 . # 版本号 a.b.c.28
docker login --username $1 --password $2

docker push miadan/my-kube-scheduler:$3 # 版本号



