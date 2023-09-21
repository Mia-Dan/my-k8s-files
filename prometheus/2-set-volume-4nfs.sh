#! /bin/bash

pwd

local_ip=$(ip a | sed -rn '/inet (.*) en/p' | cut --delimiter=' ' -f6 | cut --delimiter='/' -f1)
sed -i "s/<nfs-ip>/$local_ip/" 2-pv/pv-pvc-4nfs.yaml
