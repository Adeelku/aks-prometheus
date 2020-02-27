##!/usr/bin/env bash
### change to your desired values
LOCATION="canadacentral" 
RG_NAME="aks-poc"
CLUSTER_NAME="aks-poc"
NODE_SIZE="Standard_B2s"
NODE_COUNT="1"
NODE_DISK_SIZE="30"
VERSION="1.15.7"
AUTH_IP=$(wget -qO- https://ipecho.net/plain ; echo)

### create the cluster
az group create --name $RG_NAME --location $LOCATION
az aks create --resource-group $RG_NAME --name $CLUSTER_NAME \
  --kubernetes-version $VERSION \
  --location $LOCATION \
  --node-vm-size $NODE_SIZE \
  --load-balancer-sku standard \
  --api-server-authorized-ip-ranges "${AUTH_IP}/32" \
  --node-count $NODE_COUNT --node-osdisk-size $NODE_DISK_SIZE

# connect to the cluster
az aks get-credentials --resource-group $RG_NAME --name $CLUSTER_NAME
