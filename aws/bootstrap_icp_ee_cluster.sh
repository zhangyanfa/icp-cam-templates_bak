#!/bin/bash

################################################################
# Module to deploy IBM Cloud Private
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Licensed Materials - Property of IBM
#
# Copyright IBM Corp. 2017.
#
################################################################

ssh-keygen -b 4096 -f ~/.ssh/id_rsa -N ""
cat ~/.ssh/id_rsa.pub | sudo tee -a ~/.ssh/authorized_keys

ssh-copy-id -i ~/.ssh/id_rsa.pub root@172.20.6.156
ssh-copy-id -i ~/.ssh/id_rsa.pub root@172.20.6.158
ssh-copy-id -i ~/.ssh/id_rsa.pub root@172.20.6.159
ssh-copy-id -i ~/.ssh/id_rsa.pub root@172.20.6.160
ssh-copy-id -i ~/.ssh/id_rsa.pub root@172.20.6.161

sudo systemctl restart sshd
################################################################
i=0
host_ips=("172.20.6.157" "172.20.6.158" "172.20.6.159" "172.20.6.160" "172.20.6.161" "172.20.6.156")
host_names=("icp-poc-mp1" "icp-poc-mp2" "icp-poc-mp3" "icp-poc-worker1" "icp-poc-worker2" "icp-poc-manager")

for ip in ${host_ips[@]}
do
    ssh root@${ip} "/usr/bin/hostnamectl set-hostname ${host_names[i]}"
    
    for ip in ${host_ips[@]}
    do
        ssh root@${ip} "/bin/echo \"${ip}\" \"${host_names[i]}\" >> /etc/hosts;"
    done 

    let "i+=1"
done    

############################################################

hosts=("172.20.6.157" "172.20.6.158" "172.20.6.158" "172.20.6.160" "172.20.6.161" "172.20.6.156")
master_hosts=("172.20.6.157" "172.20.6.158" "172.20.6.158")

# Install nfs-common
for hostip in ${hosts[@]}
do
    echo "IP:${hostip}"
    ssh root@${hostip} "/usr/bin/apt-get install nfs-common -y;"
done 

# Mount registry&audit for ICP master node
for hostip in ${hosts[@]}
do
    echo "Master IP:${hostip}"
    ssh root@${hostip} "mkdir -p /var/lib/icp/audit; \
        mkdir /var/lib/registry; \
        mount -t nfs 172.20.6.3:/export/vmimage/DevLib/icp-poc/audit /var/lib/icp/audit; \
        mount -t nfs 172.20.6.3:/export/vmimage/DevLib/icp-poc/registry /var/lib/registry"
done 

# Mount ICP installation 
for hostip in ${hosts[@]}
do
    echo "IP:${hostip}"
    ssh root@${hostip} "/bin/mkdir /opt/media; \
        mount -t nfs 172.20.6.3:/export/vmimage/DevLib/media /opt/media;"
done

################################################################################




################################################################################

# Disable the firewall
/usr/sbin/ufw disable
# Enable NTP
/usr/bin/apt-get install ntp -y
# Need to set vm.max_map_count to at least 262144
/sbin/sysctl -w vm.max_map_count=262144
/bin/echo "vm.max_map_count=262144" | /usr/bin/tee -a /etc/sysctl.conf
# Prepare the system for updates, install Docker and install Python
/usr/bin/apt-get install -y apt-transport-https ca-certificates curl software-properties-common
/usr/bin/curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
/usr/bin/add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
/usr/bin/apt-get update -y
/usr/bin/apt-get install docker-ce -y
/usr/bin/apt install python -y
/usr/bin/apt install python-pip -y ; pip install docker-py 

/bin/tar xf /opt/media/ibm-cloud-private-x86_64-2.1.0.1.tar.gz -O | /usr/bin/docker load

################################################################################

# location of host 
#ICP_IMAGE_NAME="ibm-cloud-auto-mgr-x86_64-2.1.0.tar.gz"
ICP_IMAGE_NAME="ibm-cloud-private-x86_64-2.1.0.1.tar.gz"

# HTTP-accessible location of the IBM Cloud Private image to download
ICP_IMAGE_LOCATION="/opt/media"
# The IBM Cloud Private embedded Docker image
# (ibmcom/icp-inception for x86 or ibmcom/icp-inception-ppc64le for Power)
ICP_DOCKER_IMAGE="ibmcom/icp-inception"
# Version of IBM Cloud Private to install
ICP_VER="2.1.0.1"
# Root directory of ICP installation
ICP_ROOT_DIR="/opt/ibm-cloud-private-ee"


/bin/mkdir "${ICP_ROOT_DIR}-${ICP_VER}"
cd "${ICP_ROOT_DIR}-${ICP_VER}"
/usr/bin/docker run -e LICENSE=accept -v \
    "$(pwd)":/data ${ICP_DOCKER_IMAGE}:${ICP_VER}-ee cp -r cluster /data
/bin/mkdir -p cluster/images

/bin/cp ${ICP_IMAGE_LOCATION}/${ICP_IMAGE_NAME} ${ICP_ROOT_DIR}-${ICP_VER}/cluster/images/

# Configure the master, proxy and worker as the same node

master_ips=("172.20.6.157" "172.20.6.158" "172.20.6.159")
proxy_ips=("172.20.6.157" "172.20.6.158" "172.20.6.159")
worker_ips=("172.20.6.160" "172.20.6.161")
manager_ip="172.20.6.156"

/bin/echo "[master]"  > cluster/hosts
for ip in ${master_ips[@]}
do
    /bin/echo "${ip}"    >> cluster/hosts
done
/bin/echo "[proxy]"  >> cluster/hosts
for ip in ${proxy_ips[@]}
do
    /bin/echo "${ip}"    >> cluster/hosts
done
/bin/echo "[worker]" >> cluster/hosts
for ip in ${worker_ips[@]}
do
    /bin/echo "${ip}"    >> cluster/hosts
done
/bin/echo "[management]" >> cluster/hosts
/bin/echo "${manager_ip}" >> cluster/hosts


echo "loopback_dns: true"        >> cluster/config.yaml
echo "# HA settings"             >> cluster/config.yaml
echo "vip_iface: ens32"          >> cluster/config.yaml
echo "cluster_vip: 172.20.6.162" >> cluster/config.yaml
echo "# Proxy settings"          >> cluster/config.yaml
echo "proxy_vip_iface: ens32"    >> cluster/config.yaml
echo "proxy_vip: 172.20.6.163"   >> cluster/config.yaml

# Deploy IBM Cloud Private
cd "${ICP_ROOT_DIR}-${ICP_VER}/cluster"

/bin/cp ~/.ssh/id_rsa  ssh_key

/usr/bin/docker run -e LICENSE=accept --net=host -t -v \
    "$(pwd)":/installer/cluster ${ICP_DOCKER_IMAGE}:${ICP_VER}-ee install | \
    /usr/bin/tee install.log

exit 0