# Environment Setup

## Prerequisites

To begin with, you need to set up the following tools:

1. **Minikube**: A tool that lets you run Kubernetes locally.
2. **kubectl**: The command-line tool for interacting with Kubernetes clusters.
3. **Skaffold**: A command-line tool for continuous development on Kubernetes.

There's a script named `run.sh` in the `setup-env` directory that will handle all installations for you. Running this script will automatically configure Minikube, kubectl, and Skaffold, enabling you to skip this manual setup section.

Remember to change permissions before use:  `chmod +x /root/setup-env/run.sh`

However, if you would like to install each tool manually, follow the steps below:
