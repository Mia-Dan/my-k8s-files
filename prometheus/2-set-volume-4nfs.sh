#! /bin/bash

cd /root/my-k8s-files/prometheus

# Install & Setup NFS ---------------------

echo 'Y' | sudo apt install nfs-kernel-server # 1. Install the NFS server on your main system.
# 挂载文件夹假定命名为 /mnt/nfs/promdata
sudo mkdir -p /mnt/nfs/promdata # 2. Create a directory to use with Prometheus.
sudo chown nobody:nogroup /mnt/nfs/promdata 
sudo chmod 777 /mnt/nfs/promdata 

# to solve issue1: 
echo '/mnt/nfs/promdata *(insecure,rw,sync,no_root_squash)' >> /etc/exports 
exportfs -r   #更新配置
showmount -e
#    如果生效会显示
#    Export list for Ubuntu:
#    /mnt/nfs/promdata *
/etc/init.d/nfs-kernel-server restart 

# to solve issue2:
ssh node01 "sudo apt-get install -y nfs-common"


# k8s YAML  ---------------------

# edit
local_ip=$(ip a | sed -rn '/inet (.*) en/p' | cut --delimiter=' ' -f6 | cut --delimiter='/' -f1)
sed -i "s/<nfs-ip>/$local_ip/" 2-pv/pv-pvc-4nfs.yaml
# apply
kubectl apply -f 2-pv/pv-pvc-4nfs.yaml
# 应该返回：
# persistentvolume/pv-nfs-data created
# persistentvolumeclaim/pvc-nfs-data created