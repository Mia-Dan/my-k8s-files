# 环境准备
mkdir go
cd /root/go # 来自go env返回
mkdir -p src/k8s.io
cd src/k8s.io

pwd # TODO：检查下是否是下列地址
# /root/go/src/k8s.io

git clone --depth=1  https://github.com/kubernetes/kubernetes
cd kubernetes/


# 然后开始修改吧

# cd cmd/kube-scheduler
# vim scheduler.go #???

# cd ../..


# cd pkg/scheduler
# vim schedule.go

# cd ../..


cd pkg/scheduler
vim schedule_one.go

cd ../..

# 2.1.x.28 change location: around :540


