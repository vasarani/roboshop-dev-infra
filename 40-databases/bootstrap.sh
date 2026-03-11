#!/bin/bash

component=$1
dnf install ansible -y 

dnf install ansible -y
dnf install python3-pip -y
pip3 install boto3 botocore


cd /home/ec2-user
git clone https://github.com/vasarani/ansible-roboshop-roles-tf.git

cd ansible-roboshop-roles-tf

ansible-playbook -e component=$component roboshop.yaml

