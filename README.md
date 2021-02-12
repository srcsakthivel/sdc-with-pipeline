# sdc-with-pipeline
Streamset SDC with a pipeline


## Docker Build 

```
cd docker-files
bash docker.build
```

## Kubectl

```
#Create SDC with customsdc and pipeline
kubectl apply -f kube-files/deployment-ss.yml

#Create LB for the SDCs
kubectl apply -f kube-files/service-lb-sdc.yml

#Create LB for the Pipeline
kubectl apply -f kube-files/streamset-pipeline-lb.yml

#Check all
kubectl get all
```

## AKS

```
# Create Resource Group
az group create -l eastus2 -n at-myk8s

# Create AKS Cluster
az aks create --resource-group at-myk8s --name aks-cluster --node-count 3

# Get Credentials
az aks get-credentials --resource-group at-myk8s --name aks-cluster --overwrite-existing
```