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

/bin/echo "-----BEGIN RSA PRIVATE KEY-----" > /opt/icc-gpfs-key.pem
/bin/echo "MIIEpQIBAAKCAQEAvDwX0iQ49/o3YGEOvhYtL78spVEXmFquER0w6enquTt8poJU" >> /opt/icc-gpfs-key.pem
/bin/echo "ygbc1oapsXfjPWULSo5He9YidOpVK2JbLCQT+HLFYGq/BdnyxkbPfmQr9nuW9mBN" >> /opt/icc-gpfs-key.pem
/bin/echo "rPVL4SsoPMvYV9ZjvPTAgDuwnLMuehWtYX8StjnBVfSjmYJixiHL9elaJRZqP8Lw" >> /opt/icc-gpfs-key.pem
/bin/echo "7Rf/CnrVelR+amVr98i/ArJE2WpdKzUWpXM8NIItm3whpF6VryNLGvFRbCfotYbI" >> /opt/icc-gpfs-key.pem
/bin/echo "QoNzFWbOWpSfKH4WK/PR2UiwhqO3nm0RL3QqVc6eQpER979QkoSdQJZcIkNoDC3n" >> /opt/icc-gpfs-key.pem
/bin/echo "1/BNo/8HV9OTRvEu97GVcBXElNYPMiwdaySgOwIDAQABAoIBAGACOpgpd5Er46Da" >> /opt/icc-gpfs-key.pem
/bin/echo "AF3+C7Alz0zGzsUbw1rhS7iTYfB2of5/zWV6GJum9diZ8KK47ghqB5XnQ43kk+pb" >> /opt/icc-gpfs-key.pem
/bin/echo "8WrTQAhh6cBi0enXH5f4OA8cYrwGj5o8xoGoX7qKe6x+wGsU46xWHfWJ/GwAjH0i" >> /opt/icc-gpfs-key.pem
/bin/echo "n1tyKAYf8Te5XtSGh4DNbi2QhzUQlyZO2HEP6bEp2hA001shMcrYMvaHh5opdC9Q" >> /opt/icc-gpfs-key.pem
/bin/echo "AkGu/Sa+8tsTHM6cD4BEHkYCqiShnfeRF+GM6OUj9TuA99PsCeb1vErdt6742cgR" >> /opt/icc-gpfs-key.pem
/bin/echo "5YvrY94xySRgGT5mCU61EfIUDsmuqbR/GtFFX5Su9BoQ0viYvXL2YJOixZjviNlr" >> /opt/icc-gpfs-key.pem
/bin/echo "YWOiS7ECgYEA+Be25V936HQx70lswMA4lAZSMg6ktoV3M8MOVO8DArBAJ1ipdKmh" >> /opt/icc-gpfs-key.pem
/bin/echo "2Q1v2sDFhl8hENI4s/e6LpzBYmR36bj3Ikj/7EUwFt8C8xuBvVzbJyaTMjV3TZ1X" >> /opt/icc-gpfs-key.pem
/bin/echo "KyeIi0NrRSJj9scYLRgEJETNLqlQrsjybzg29/vaL3AKdPGu4QoQBEkCgYEAwjv5" >> /opt/icc-gpfs-key.pem
/bin/echo "db0e2m/P4sRqg0TpGOMG5DVeTF4ofiRdXW1d7/9MW9od0F8UZRuoUIurFWWq9b81" >> /opt/icc-gpfs-key.pem
/bin/echo "ynGzVnvPbPYKq6QsLZXlV//ODGGWTOTrbBn3siNTadwPwqJDof4hvMGvVHAU15IT" >> /opt/icc-gpfs-key.pem
/bin/echo "uHbvjDwXgL09NyWcXip4ISwQcMqKBFhd2F/rOGMCgYEAgIHwKBHyj4MYloUnAxTO" >> /opt/icc-gpfs-key.pem
/bin/echo "ecZobytsoGqz2ykPVGlV2t+m63qelCKGBmNSbDJsXnUKMKdj3bzVQO3Lsgauom8/" >> /opt/icc-gpfs-key.pem
/bin/echo "/A9qGV2hUkeERJ8b7hWaI0Z0+o39VUPJ8j2RGen7N51fwGVSnZESHCNTUPc9JrxJ" >> /opt/icc-gpfs-key.pem
/bin/echo "79hjiMJ5OxdDI15JIqJOt5kCgYEAokIv1yeyCpC1fZ7Py/FZOK0PKL1clTdjZF1E" >> /opt/icc-gpfs-key.pem
/bin/echo "kbO3cbI4O9MubM/A3eYI6aCDv1A7TSf666+oPWsYkNHJgDGZpks+WBEeNEGhqYLj" >> /opt/icc-gpfs-key.pem
/bin/echo "GF9pCKtyF1D66YFcNotx65lxunwXLS6ews64ttHMYIO2C8ejpRadXDjPUyofuhmH" >> /opt/icc-gpfs-key.pem
/bin/echo "7CXU/jkCgYEAiHZ4N4LwsIsiJGVg87asADsMaHWO3usLyxlgzhfGbtqxK203E4zj" >> /opt/icc-gpfs-key.pem
/bin/echo "KylIRPM4WRfoeXlSneejM/SGknTvUHx1ps9jtLXWtCKF1bR58Ai5F6CGb5Vgh9gC" >> /opt/icc-gpfs-key.pem
/bin/echo "W8w9ME/CgvmScWsDWsVpEBV1KamwKlJTM8E6ghCTXoLIr72ibPJOLfk=" >> /opt/icc-gpfs-key.pem
/bin/echo "-----END RSA PRIVATE KEY-----" >> /opt/icc-gpfs-key.pem

/bin/chmod 400 /opt/icc-gpfs-key.pem

/bin/sed -i 's/#PermitRootLogin/PermitRootLogin/g' /etc/ssh/sshd_config

/bin/echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC8PBfSJDj3+jdgYQ6+Fi0vvyylUReYWq4RHTDp6eq5O3ymglTKBtzWhqmxd+M9ZQtKjkd71iJ06lUrYlssJBP4csVgar8F2fLGRs9+ZCv2e5b2YE2s9UvhKyg8y9hX1mO89MCAO7Ccsy56Fa1hfxK2OcFV9KOZgmLGIcv16VolFmo/wvDtF/8KetV6VH5qZWv3yL8CskTZal0rNRalczw0gi2bfCGkXpWvI0sa8VFsJ+i1hshCg3MVZs5alJ8ofhYr89HZSLCGo7eebREvdCpVzp5CkRH3v1CShJ1AllwiQ2gMLefX8E2j/wdX05NG8S73sZVwFcSU1g8yLB1rJKA7 root@Node1" >> /root/.ssh/authorized_keys

/usr/bin/systemctl restart sshd

# location of host 
#ICP_IMAGE_NAME="ibm-cloud-auto-mgr-x86_64-2.1.0.tar.gz"
ICP_IMAGE_NAME="ibm-cloud-private-x86_64-2.1.0.1.tar.gz"

# HTTP-accessible location of the IBM Cloud Private image to download
ICP_IMAGE_HTTP_LOCATION="http://<HOSTNAME>/<PATH_TO_ICP_TAR_BALL>"
# The IBM Cloud Private embedded Docker image
# (ibmcom/icp-inception for x86 or ibmcom/icp-inception-ppc64le for Power)
ICP_DOCKER_IMAGE="ibmcom/icp-inception"
# Version of IBM Cloud Private to install
ICP_VER="2.1.0.1"
# Root directory of ICP installation
ICP_ROOT_DIR="/opt/ibm-cloud-private"

# Disable the firewall
/usr/bin/systemctl stop firewalld.service
# Enable NTP
/usr/bin/yum -y install ntp
/usr/bin/systemctl enable ntpd
/usr/bin/systemctl start ntpd
# Need to set vm.max_map_count to at least 262144
/sbin/sysctl -w vm.max_map_count=262144
/bin/echo "vm.max_map_count = 262144" | /usr/bin/tee -a /etc/sysctl.conf
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
IP=`/sbin/ifconfig -a | grep 'inet' | grep '172.20' | cut -d: -f2 | awk '{print $2}'`
/bin/echo "${IP} $(hostname)" > /etc/hosts

# Download and configure IBM Cloud Private
TMP_DIR="/opt"

cd "${TMP_DIR}"

/bin/scp -i "/opt/icc-gpfs-key.pem" -o StrictHostKeyChecking=no root@172.20.6.3:/export/vmimage/DevLib/media/${ICP_IMAGE_NAME} ./${ICP_IMAGE_NAME}

/bin/tar xf *.tar.gz -O | /usr/bin/docker load

/bin/mkdir "${ICP_ROOT_DIR}-${ICP_VER}"
cd "${ICP_ROOT_DIR}-${ICP_VER}"
/usr/bin/docker run -e LICENSE=accept -v \
    "$(pwd)":/data ${ICP_DOCKER_IMAGE}:${ICP_VER}-ee cp -r cluster /data
/bin/mkdir -p cluster/images
/bin/mv ${TMP_DIR}/*.tar.gz ${ICP_ROOT_DIR}-${ICP_VER}/cluster/images/
#/bin/rm -rf "${TMP_DIR}"


/bin/echo "${IP}"    >> /etc/hosts

# Configure the master, proxy and worker as the same node
/bin/echo "[master]"  > cluster/hosts
/bin/echo "${IP}"    >> cluster/hosts
/bin/echo "[proxy]"  >> cluster/hosts
/bin/echo "${IP}"    >> cluster/hosts
/bin/echo "[worker]" >> cluster/hosts
/bin/echo "${IP}"    >> cluster/hosts

# Deploy IBM Cloud Private
cd "${ICP_ROOT_DIR}-${ICP_VER}/cluster"

#sed -i 's/# cluster_access_ip: 0.0.0.0/cluster_access_ip: 52.24.157.233/g' config.yaml 
#sed -i 's/# proxy_access_ip: 0.0.0.0/proxy_access_ip: 52.24.157.233/g' config.yaml

sed -i 's/# loopback_dns: false/loopback_dns: true/g' config.yaml

/bin/rm -rf /var/lib/mysql

/usr/bin/docker run -e LICENSE=accept --net=host -t -v \
    "$(pwd)":/installer/cluster ${ICP_DOCKER_IMAGE}:${ICP_VER}-ee install | \
    /usr/bin/tee install.log

exit 0

