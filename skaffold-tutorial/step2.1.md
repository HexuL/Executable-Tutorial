## Manual Installation

### Step 2.1: Install and Start Minikube

Minikube is a tool that lets you run Kubernetes clusters locally. To install and start Minikube, execute the following commands:

`curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64`

`sudo install minikube-linux-amd64 /usr/local/bin/minikube`

`minikube start --driver=docker --extra-config=kubeadm.ignore-preflight-errors=NumCPU --force --cpus=1 --memory=1983mb`

These commands will install Minikube and start it with Docker as the driver, allocating 1 CPU and 1983 MB of memory.