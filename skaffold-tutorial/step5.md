# Use Skaffold for continuous development 

In this section, we can start using Skaffold.

To experiment with the skaffold dev command, we've done all the configuration. This will scan our project and automatically build and deploy to our K8S cluster as soon as changes are made. Execute the following command
`skaffold dev`

Our application is being built and deployed to a K8S cluster. The operation can be observed in the minikube dashboard
`minikube dashboard`