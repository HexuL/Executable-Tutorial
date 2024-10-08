#!/bin/bash

# install Minikube
curl -LO "https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64"
sudo install minikube-linux-amd64 /usr/local/bin/minikube
minikube version

# start Minikube
minikube start --driver=docker --extra-config="kubeadm.ignore-preflight-errors=NumCPU" --force --cpus=1 --memory="1983mb"

# install kubectl
curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
kubectl version

# install Skaffold
curl -Lo skaffold "https://storage.googleapis.com/skaffold/releases/latest/skaffold-linux-amd64"
chmod +x skaffold
sudo mv skaffold /usr/local/bin/skaffold
skaffold version


echo "Minikube, kubectl and Skaffold install successful."