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

/bin/echo "-----BEGIN RSA PRIVATE KEY-----" > /home/centos/icp-public-key.pem
/bin/echo "MIIEpQIBAAKCAQEAyfGdK2luQTP9UoQOraB+C0Vcp2piClNnZ1boHl0YkSNiKYm7XP6EDY50uJoR" >> /home/centos/icp-public-key.pem
/bin/echo "R/DkAGUBJqGnQKFzWgnOFmyh7tEP5JVoBkoxMVic5wcv7yPd7/KM/0KJLkKbz/rRebscWkwMUa39" >> /home/centos/icp-public-key.pem
/bin/echo "ds7JIThcu9VQFxd9Fhaq97VYXntxovIJm9a8pDqaUoG5fT003t6AewRLlDeX/qkTDrZsPwMbmcBH" >> /home/centos/icp-public-key.pem
/bin/echo "KzcvifvejljQGauVbY6o3eImyfAFQNecLrpzP8PGWtkbvLwLyLOe56839qk8EBUjLVnyCvqXzq5e" >> /home/centos/icp-public-key.pem
/bin/echo "ktyinvFXlnvdWNhw0NbalKgVIx2RhpEGr5pFAyn9LrIcCmJO6viniwIDAQABAoIBAG5omgydFPmz" >> /home/centos/icp-public-key.pem
/bin/echo "KgIOT1QgVillX9XsdPO+S9+VBU1sirz3gnjBY93hDWO4ChrPqTkS/CU3E90CLsZIPx/wEmvyMsq2" >> /home/centos/icp-public-key.pem
/bin/echo "JKFOClS+BY08LHSnWk695l6E1w/MWeIf6r5YHGUYptS7lVSm8tgdEJwIC7NqWeJ2Jh6IgCr0S/9E" >> /home/centos/icp-public-key.pem
/bin/echo "MIntGNHJKHxFE9HTW/vjixet3pIaQPQnqrlbNdLMwUVm9DdSGiCzLROklTp9ALaRmISxnmY8YPTq" >> /home/centos/icp-public-key.pem
/bin/echo "B4WfkOjMOWPQfQjrqsuOss5zCegA+bnJA+VXuSZ3RO7+plRqI2H4LAjYZazBGy4Z4tuGmMa8wDhZ" >> /home/centos/icp-public-key.pem
/bin/echo "02Lq1xTN6JkxBdnBDQ5wiZH2YqkCgYEA/7f7GbCnbXzxp4hWutymYCddvS+L/eX+LVXOTLZzrtsc" >> /home/centos/icp-public-key.pem
/bin/echo "fVUyLJ3DCc4EIbk0Vlgm9Y4M85D8bSyknfRaiSV+omxSJgaC4POnHR+EZevcYY3I5Rcm98sk2npP" >> /home/centos/icp-public-key.pem
/bin/echo "cQzhP8yhjB2gn8jCYH1oZ36f3ygUOgauVKqMto2CMfkCYPJNlb8CgYEAyip8/RtnRPRqvRddYYWy" >> /home/centos/icp-public-key.pem
/bin/echo "mP6TdZcxYRtMRKPNMSdJEcfRYRn2TqSV86cf96K0XaBPl63SpcbPssgQB8dFidFNRckIhTu3Akb5" >> /home/centos/icp-public-key.pem
/bin/echo "ifECZsvzx0JTbqkrBB/MTj7zOB9Am8jrHWcMzINhDustQKZw8DNjq/YZJbdKdG2unJ3IyM73GTUC" >> /home/centos/icp-public-key.pem
/bin/echo "gYEAv6BIO8UkgiiqEkhZ7eehidaWKUozFs29/o0ZbmUfJX4uyEEKu2JxoKxQblESRk4Cy+pqDC+u" >> /home/centos/icp-public-key.pem
/bin/echo "6cUViwRsv+9oCSExIiuo8hfEOE/A8HuiBzyvufTyj6gccthLJcVoGl4nBQ/CqVpRRutTTJMYDKtF" >> /home/centos/icp-public-key.pem
/bin/echo "FQKiqvGvRrGeSgJ25N1OhJMCgYEAhC3NdKtTFMl9dE5vdpC0mcVw4iRNW8E+V26FfUrDQoXTxtnz" >> /home/centos/icp-public-key.pem
/bin/echo "qa2AgULW6tENfl2PTIuQu2TGbYzStlM6iwY2sJblJD9Lw4hmJSNXv6A/rhsWc7bVcifcK5iK6zm7" >> /home/centos/icp-public-key.pem
/bin/echo "w19VIe87dge8EMYA21E3bEUdONR50qgJXSBNVwbuvSRceLUCgYEAhCujTkV98wFzdpi3lxTjrVRM" >> /home/centos/icp-public-key.pem
/bin/echo "Wzt/zbbxW5SdUkiKws24iUK9t6jHoWC9f9qAGpsg9T4bb3ECreZ9xrx5mBXlTl1k86DKqcEL2ZuZ" >> /home/centos/icp-public-key.pem
/bin/echo "5t1ctHcqyf66wIbxj8YLou8rhkYGjifTW7dAQojN3Gu2cXgojaZVL3nOaVhwonz3OBDZuxE=" >> /home/centos/icp-public-key.pem
/bin/echo "-----END RSA PRIVATE KEY-----" >> /home/centos/icp-public-key.pem

/bin/chmod 400 /home/centos/icp-public-key.pem

/bin/sed -i 's/#PermitRootLogin/PermitRootLogin/g' /etc/ssh/sshd_config
/bin/cp /home/centos/.ssh/authorized_keys /root/.ssh/authorized_keys
/usr/bin/systemctl restart sshd

# location of host 
#ICP_IMAGE_NAME="ibm-cloud-auto-mgr-x86_64-2.1.0.tar.gz"
ICP_IMAGE_NAME="ibm-cloud-private-x86_64-2.1.0.tar.gz"

# HTTP-accessible location of the IBM Cloud Private image to download
ICP_IMAGE_HTTP_LOCATION="http://<HOSTNAME>/<PATH_TO_ICP_TAR_BALL>"
# The IBM Cloud Private embedded Docker image
# (ibmcom/icp-inception for x86 or ibmcom/icp-inception-ppc64le for Power)
ICP_DOCKER_IMAGE="ibmcom/icp-inception"
# Version of IBM Cloud Private to install
ICP_VER="2.1.0"
# Root directory of ICP installation
ICP_ROOT_DIR="/opt/ibm-cloud-private-ee"

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
TMP_DIR="$(/bin/mktemp -d)"

cd "${TMP_DIR}"

/bin/scp -i "/home/centos/icp-public-key.pem" -o StrictHostKeyChecking=no centos@172.31.20.177:/home/centos/${ICP_IMAGE_NAME} ./${ICP_IMAGE_NAME}

/bin/tar xf *.tar.gz -O | /usr/bin/docker load

/bin/mkdir "${ICP_ROOT_DIR}-${ICP_VER}"
cd "${ICP_ROOT_DIR}-${ICP_VER}"
/usr/bin/docker run -e LICENSE=accept -v \
    "$(pwd)":/data ${ICP_DOCKER_IMAGE}:${ICP_VER}-ee cp -r cluster /data
/bin/mkdir -p cluster/images
/bin/mv ${TMP_DIR}/*.tar.gz ${ICP_ROOT_DIR}-${ICP_VER}/cluster/images/
/bin/rm -rf "${TMP_DIR}"

# Configure the master, proxy and worker as the same node
/bin/echo "[master]"  > cluster/hosts
/bin/echo "${IP}"    >> cluster/hosts
/bin/echo "[proxy]"  >> cluster/hosts
/bin/echo "${IP}"    >> cluster/hosts
/bin/echo "[worker]" >> cluster/hosts
/bin/echo "${IP}"    >> cluster/hosts

# Deploy IBM Cloud Private
cd "${ICP_ROOT_DIR}-${ICP_VER}/cluster"

/bin/echo "-----BEGIN RSA PRIVATE KEY-----" > ssh_key
/bin/echo "MIIEpAIBAAKCAQEAs27MgjFgd9aMz7TbnWn3e+4/RekgisqNoZmyl8sikqeh+IMw" >> ssh_key
/bin/echo "9DrFFoLb14mpv6cKrz5ooYNgL/I4rZRKfYCuu8xkJy45TVI1O9DsZcub5fQ3wCdr" >> ssh_key
/bin/echo "t3V7KFmMA1doW3+qh1+V2TKQxjHK43gUIOsJUILhA/+Vpieh+lC7sh5/84v14H3v" >> ssh_key
/bin/echo "ItsMVNP3X9J/H7kiSs8fdy4m5habUSLEcZuQJ3uHyKH1mvmH7T5meAM7/d7edB5K" >> ssh_key
/bin/echo "c5yVoJzIEYRa+ljXdZWb0ztz+DWMaqnG8cI3AuB1XwIVmSWdBnHhHzcotb5QXMo/" >> ssh_key
/bin/echo "X1vUxHOyxNqVZ4CS5s2zPxl93CyRGMiPM/0OnwIDAQABAoIBAQCsZjCohriha8sv" >> ssh_key
/bin/echo "Zh38SOw4btjsWumhcKxUMFCf99ToA5hkJejLQAxNbL29gc9PDTf+2H+/b3Ljnl9G" >> ssh_key
/bin/echo "p8xKeXFpjyBLZOY5nFr5dessg0zuzI8kWLvuMTp7sk4Mh9cE0s0N9JENdsATLZQ6" >> ssh_key
/bin/echo "qgzs8+anLJj2NoOaeUnwL9GnehaF8L7j2QoMZe9jojPvjcA1xADHRxymSQ26lupr" >> ssh_key
/bin/echo "wt5P4hY7Q+zt3n9HmcssyDJlKSM94Sp+0j3JfkRPogP/ayrJTzBJumKeOsz0ehFw" >> ssh_key
/bin/echo "k/E+tgq46YbEDF6fBvJslwrjLQ5+QxYGXMUU+P6O8G12uetUNowinqT21iXwjAZW" >> ssh_key
/bin/echo "w/6oYxhBAoGBAOdxFwiGujL296c5JCntSjMHvMv4E1tjw9QAabXR3lv3FUmQKTm+" >> ssh_key
/bin/echo "bnqng3hux1n+csAuPkooAb+1ais/3bbAbnCmzljzS2Q+bhWwiU2CiS61ATblfhEm" >> ssh_key
/bin/echo "lio1drH96KZ0M605dt2n4GMWn+Zv88o36jWrwpJui6jZnjuy2HpesKktAoGBAMZ4" >> ssh_key
/bin/echo "7pGiRoePrnzlya/UEBES9+Z8L9JsBnSxO+UDlmjsBjKRzWgWExciEdapZwqG92Lu" >> ssh_key
/bin/echo "oAoR7CfbPCj2BEU8kxl1+clcYwW+Xnu5nfqUCxohwGmDrt+uWaWrknUdHHq6uKRV" >> ssh_key
/bin/echo "488OjtjIJMx3FlYKVteuM4Z2vclGIkJkf0wKup57AoGAekqKVioCVw2iHE0YK8ND" >> ssh_key
/bin/echo "UqWC/+/MIp0bi3jQYo9LRCLRr7Yp4mYaMFs1H7zBP28wqRWGOl7bVbYBLGsptvgF" >> ssh_key
/bin/echo "Iycwn1Wm/4fxWSqX0knoPLLNunkW3O8bp5/qYPB+Lv31lFFp2oNrEFCTGwsKsU5M" >> ssh_key
/bin/echo "RiHExOT+jLC4aGj+8+H2zN0CgYEAuf7QzEhAQoBDLCcISK+6UtXs3eHZyx+TOT5y" >> ssh_key
/bin/echo "+97N0QwHjtKWpYmyYEZ8YygkOXhcVCl+b5F2N6+8BELxo5Tt4blu2earodFSqC4+" >> ssh_key
/bin/echo "P3sHoHiq4fcXJeY1ew171ibu7pEXwmH/eKaS9dMysS6VDxLnaX6GKOgUWZBRQNj/" >> ssh_key
/bin/echo "dtrDIwsCgYBXTSNG6lDauqXoYpmtwCdCVaqRT8NWu7hGx3eHjD+xxLkB9cQyz5mj" >> ssh_key
/bin/echo "nn2iMWc2qXkCnwGQAU/oxsowqx2C6VJu9VxtgF74XDiuTSkWczjY5zVP6yHzTb9S" >> ssh_key
/bin/echo "OGnCiO/kFKf5O73xlAsWfvbnI5FUcjutNyuGlPJiEMa3X52Q2tVEgg==" >> ssh_key
/bin/echo "-----END RSA PRIVATE KEY-----" >> ssh_key

/bin/chmod 777 ssh_key

/usr/bin/docker run -e LICENSE=accept --net=host -t -v \
    "$(pwd)":/installer/cluster ${ICP_DOCKER_IMAGE}:${ICP_VER}-ee install | \
    /usr/bin/tee install.log

exit 0