#!/bin/bash

echo "************************************************Please enter sudo password************************************************************"
echo "**************************************************************************************************************************************"
sudo ls


git clone https://github.com/Learn4Ops/jenkinstest.git

cd jenkinstest

echo "**************************************************************************************************************************************"
echo "***********************************************************Installing Java************************************************************"
echo "**************************************************************************************************************************************"

sudo apt update -y

sudo sudo apt install openjdk-11-jdk -y

java -version


echo "**************************************************************************************************************************************"
echo "***********************************************************Installing Jenkins*********************************************************"
echo "**************************************************************************************************************************************"



curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null


echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

sudo apt-get update

sudo apt-get install jenkins -y 

cp -r jenkins/* /var/lib/jenkins/

sudo systemctl restart jenkins

JENKINS_PW=$(cat /var/lib/jenkins/secrets/initialAdminPassword)




echo "**************************************************************************************************************************************"
echo "***********************************************************Installing RKE2 ***********************************************************"
echo "**************************************************************************************************************************************"

curl -sfL https://get.rke2.io | INSTALL_RKE2_CHANNEL=v1.21 sudo sh -

sudo systemctl enable rke2-server.service

sudo systemctl start rke2-server.service


sudo chown $USER: /etc/rancher/rke2/rke2.yaml 



echo "**************************************************************************************************************************************"
echo "***********************************************************Installing terraform*******************************************************"
echo "**************************************************************************************************************************************"


sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl

curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -

sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"

sudo apt-get update && sudo apt-get install terraform -y

echo "**************************************************************************************************************************************"
echo "***********************************************************Installing Kubectl And Helm************************************************"
echo "**************************************************************************************************************************************"

sudo apt-get install -y apt-transport-https ca-certificates curl

sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg

echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list

sudo apt-get update -y

sudo apt-get install -y kubectl

curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

mkdir -p ~/.kube

cp /etc/rancher/rke2/rke2.yaml ~/.kube/config

echo "**************************************************************************************************************************************"
echo "***********************************************************Managing Applications******************************************************"
echo "**************************************************************************************************************************************"

kubectl create ns application

kubectl create ns opensource

echo "********Jenkins Password************"

echo $JENKINS_PW

HOST_IP=$(hostname -I | awk '{print$1}')

echo "Assuming host local ip............."
echo "Host Local ip $HOST_IP"
echo "You can browse Jenkins wiht $HOST_IP:8080  " \n
echo " User: admin     PW: $JENKINS_PW "