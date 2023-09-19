#! /bin/bash
cd ~/go/src/k8s.io/kubernetes

# 按k8s的文件夹中的makefile编译 -> binary
KUBE_BUILD_PLATFORMS=linux/amd64 make WHAT=cmd/kube-scheduler GOFLAGS=-v GOGCFLAGS="-N -l" -j4

# 现在binary build好了，要上传docker了
touch Dockerfile
echo "FROM busybox">>Dockerfile
echo "ADD ./_output/local/bin/linux/amd64/kube-scheduler /usr/local/bin/kube-scheduler">>Dockerfile


echo "enter image tag (version a.b.c.28):"
read tag-ver

docker build -t miadan/my-kube-scheduler:$tag-ver . # 注意改掉版本号
docker login 

docker push miadan/my-kube-scheduler:$tag-ver # 注意改掉版本号



