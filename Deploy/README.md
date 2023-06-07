# Kubernetes deployment files 

I made used of Jenkins and ArgoCD and operation 

 Jenkins stages:
1. first stage is to checkout the repo
2. build a docker image if available 
3. push to dockerhub
4. deploy to kubernetes 

ArgoCD: I use argocd to manage Kubernetes deployment, the Deploy folder serve as Source of Truth for managing deploying. 
Files:
1. hpa-pod.yml: This is the Autoscaller pod that scale application pod horizontally base on demand
2. service.yml: This is the service discovery file
3. webserver.yml: This is the deployment file for our application 


We can as well configure a ingress controller for our application using cloud ingress or nginx HA proxy pod
