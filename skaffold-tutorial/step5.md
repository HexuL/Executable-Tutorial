# Use Skaffold for continuous development 

In this section, we can start using Skaffold.

To experiment with the skaffold dev command, we've done all the configuration. This will scan our project and automatically build and deploy to our K8S cluster as soon as changes are made. Execute the following command
`skaffold dev`

Our application is being built and deployed to a K8S cluster. The operation can be observed in the minikube dashboard
`minikube dashboard`

Since we haven't created a service, we can't call our URL yet. we'll map port 8080 by using NodePort. use the kubectl command to generate a service yaml file, and copy the contents (ignoring the label) to the file service.yaml
`kubectl expose deployment myskaffoldplanet --type=NodePort --port=8080 --dry-run=client -oyaml`

Also, add the service.yaml file as a mainfest file to the skaffold.yaml file:

```
manifests:

- k8s/deployment.yaml
- k8s/service.yaml
```

Skaffold quickly observes these changes and creates the service automatically. This can be confirmed in the Skaffold console output:

Modify the welcome message in HelloController:

```
StringBuilder message = new StringBuilder(‘Hello there, Skaffold!’);
```

Once again, the changes are automatically recognised by Skaffold, and in the background process, our application is being built and deployed. Once again, we call the URL

`curl http://localhost:8080/hello`