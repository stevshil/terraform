#!/bin/bash
yum -y install docker git
systemctl enable docker
systemctl start docker
cd /home/ec2-user
git clone https://JangleFett@bitbucket.org/JangleFett/simple_academy_php_app.git
chown -R ec2-user:ec2-user simple_academy_php_app
