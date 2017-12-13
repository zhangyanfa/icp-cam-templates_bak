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
# location of host 
ICP_IMAGE="/home/tmp/ibm-cloud-auto-mgr-x86_64-2.1.0.tar.gz"

# HTTP-accessible location of the IBM Cloud Private image to download
ICP_IMAGE_HTTP_LOCATION="http://<HOSTNAME>/<PATH_TO_ICP_TAR_BALL>"
# The IBM Cloud Private embedded Docker image
# (ibmcom/icp-inception for x86 or ibmcom/icp-inception-ppc64le for Power)
ICP_DOCKER_IMAGE="ibmcom/icp-inception"
# Version of IBM Cloud Private to install
ICP_VER="2.1.0"
# Root directory of ICP installation
ICP_ROOT_DIR="/opt/ibm-cloud-private-ee"

/bin/mkdir "${ICP_ROOT_DIR}-${ICP_VER}"

# Disable the firewall
/usr/bin/systemctl stop firewalld.service
# Enable NTP
/usr/bin/yum -y install ntp
/usr/bin/systemctl enable ntpd
/usr/bin/systemctl start ntpd
# Need to set vm.max_map_count to at least 262144
/sbin/sysctl -w vm.max_map_count=262144
/bin/echo "vm.max_map_count=262144" | /usr/bin/tee -a /etc/sysctl.conf
# Prepare the system for updates, install Docker and install Python
/usr/bin/yum install -y yum-utils device-mapper-persistent-data lvm2
/usr/bin/yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
/usr/bin/yum install -y docker-ce
/usr/bin/systemctl start docker
/usr/bin/yum install -y python-setuptools
/usr/bin/easy_install pip

/usr/bin/systemctl stop docker
/bin/echo "{" > /etc/docker/daemon.json
/bin/echo "    \"storage-driver\": \"devicemapper\"" >> /etc/docker/daemon.json
/bin/echo "}" >> /etc/docker/daemon.json
/usr/bin/systemctl start docker

# Ensure the hostnames are resolvable
IP=`/sbin/ifconfig eth0 | grep 'inet' | cut -d: -f2 | awk '{print $2}'`
/bin/echo "${IP} $(hostname)" >> /etc/hosts

# Download and configure IBM Cloud Private
USER_DIR="/home/tmp"
cd "${USER_DIR}"
/bin/tar xf *.tar.gz -O | /usr/bin/docker load


cd "${ICP_ROOT_DIR}-${ICP_VER}"
/usr/bin/docker run -e LICENSE=accept -v \
    "$(pwd)":/data ${ICP_DOCKER_IMAGE}:${ICP_VER}-ee cp -r cluster /data
/bin/mkdir -p cluster/images
/bin/mv ${USER_DIR}/*.tar.gz ${ICP_ROOT_DIR}-${ICP_VER}/cluster/images/

# Configure the master, proxy and worker as the same node
/bin/echo "[master]"  > cluster/hosts
/bin/echo "${IP}"    >> cluster/hosts
/bin/echo "[proxy]"  >> cluster/hosts
/bin/echo "${IP}"    >> cluster/hosts
/bin/echo "[worker]" >> cluster/hosts
/bin/echo "${IP}"    >> cluster/hosts

# Setup the private key for the ICP cluster (injected at deploy time)
/bin/cp /root/id_rsa.terraform ${ICP_ROOT_DIR}-${ICP_VER}/cluster/ssh_key
/bin/chmod 400 ${ICP_ROOT_DIR}-${ICP_VER}/cluster/ssh_key

# Deploy IBM Cloud Private
cd "${ICP_ROOT_DIR}-${ICP_VER}/cluster"
/usr/bin/docker run -e LICENSE=accept --net=host -t -v \
    "$(pwd)":/installer/cluster ${ICP_DOCKER_IMAGE}:${ICP_VER}-ee install | \
    /usr/bin/tee install.log

exit 0