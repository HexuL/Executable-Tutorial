# Initialize Skaffold

In this section, we will initialize our Skaffold. By the end of this setup, you will have a skaffold.yaml file that helps automate Kubernetes deployments.

**Step 1: Generate Kubernetes Manifest (deployment.yaml)**

1. Use kubectl to generate the manifest file for kubernetes

First, create a Kubernetes deployment manifest for your application using kubectl. This manifest will describe your application’s desired state in Kubernetes.
Run the following command to generate a manifest file for the deployment:

`kubectl create deployment myskaffoldplanet --image=docker.io/mydeveloperplanet/myskaffoldplanet --dry-run=client -oyaml`

2. Create the deployment.yaml file

Once the kubectl command generates the manifest in the terminal, you need to save it as a deployment.yaml file.

- create a new file
`touch deployment.yaml`

- Open the file using the nano text editor
`nano deployment.yaml`

- Copy the output from the kubectl command, paste it into the deployment.yaml file, and save it:
	- Press Ctrl + O to save the file.
	- Press Ctrl + X to exit the editor.

At this point, you have your Kubernetes deployment manifest (deployment.yaml) ready.