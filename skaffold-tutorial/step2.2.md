### Step 2.2: Install kubectl

To manage Kubernetes clusters, we need the `kubectl` command-line tool. Install it with the following commands:

`curl -LO https://storage.googleapis.com/kubernetes-release/release/curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt/bin/linux/amd64/kubectl`

`chmod +x ./kubectl`

`sudo mv ./kubectl /usr/local/bin/kubectl`

These commands will download and install the latest version of kubectl.