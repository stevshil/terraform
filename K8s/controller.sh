#!/bin/bash

yum -y install git python3 python3-pip python3-setuptools
cd /root
git clone -b v2.12.0 https://github.com/kubernetes-sigs/kubespray.git
mkdir kubespray/inventory/mycluster
#git checkout tags/v2.12.0 -b v2.12.0
cd /
pip install /root/kubespray/requirements.txt
pip3 install /root/kubespray/requirements.txt
pip install ansible
pip3 install ansible

# Install kubectl
wget https://storage.googleapis.com/kubernetes-release/release/v1.17.0/bin/linux/amd64/kubectl -O /bin/kubectl
chmod 755 /bin/kubectl
