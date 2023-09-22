#! /bin/bash

pwd
echo 'Y' | sudo apt install nfs-kernel-server # 1. Install the NFS server on your main system.
sudo mkdir -p /mnt/nfs/promdata # 2. Create a directory to use with Prometheus.
sudo chown nobody:nogroup /mnt/nfs/promdata 
sudo chmod 777 /mnt/nfs/promdata 

local_ip=$(ip a | sed -rn '/inet (.*) en/p' | cut --delimiter=' ' -f6 | cut --delimiter='/' -f1)
sed -i "s/<nfs-ip>/$local_ip/" 2-pv/pv-pvc-4nfs.yaml

kubectl apply -f 2-pv/pv-pvc-4nfs.yaml

# 1. sudo apt install nfs-kernel-server
    # ...
    # Creating config file /etc/idmapd.conf with new version
    # Adding system user `statd' (UID 115) ...
    # Adding new user `statd' (UID 115) with group `nogroup' ...
    # Not creating home directory `/var/lib/nfs'.
    # Created symlink /etc/systemd/system/multi-user.target.wants/nfs-client.target → /lib/systemd/system/nfs-client.target.
    # Created symlink /etc/systemd/system/remote-fs.target.wants/nfs-client.target → /lib/systemd/system/nfs-client.target.
    # nfs-utils.service is a disabled or a static unit, not starting it.
    # Setting up nfs-kernel-server (1:1.3.4-2.5ubuntu3.5) ...
    # Created symlink /etc/systemd/system/multi-user.target.wants/nfs-server.service → /lib/systemd/system/nfs-server.service.
    # Job for nfs-server.service canceled.

    # Creating config file /etc/exports with new version

    # Creating config file /etc/default/nfs-kernel-server with new version
    # Processing triggers for systemd (245.4-4ubuntu3.18) ...
    # Processing triggers for man-db (2.9.1-1) ...
    # Processing triggers for libc-bin (2.31-0ubuntu9.9) ...