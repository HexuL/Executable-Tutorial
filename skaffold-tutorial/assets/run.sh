#!/bin/bash

# 安装 Minikube
curl -LO "https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64"
sudo install minikube-linux-amd64 /usr/local/bin/minikube
minikube version

# 启动 Minikube
minikube start --driver=docker --extra-config="kubeadm.ignore-preflight-errors=NumCPU" --force --cpus=1 --memory="1983mb"

# 安装 kubectl
curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
kubectl version

# 安装 Skaffold
curl -Lo skaffold "https://storage.googleapis.com/skaffold/releases/latest/skaffold-linux-amd64"
chmod +x skaffold
sudo mv skaffold /usr/local/bin/skaffold
skaffold version

# 提示用户安装已完成
echo "Minikube, kubectl 和 Skaffold 已成功安装并配置完成。"