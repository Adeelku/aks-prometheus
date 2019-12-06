##!/usr/bin/env bash
set -e
echo "Creating namespace"
NS='monitoring'
if kubectl get ns | grep -iq $NS; 
then
    echo "Namespace $NS already exists";
else
    echo "Creating namespace $NS"
    kubectl create namespace $NS;
fi
echo "Installing/Upgrading Prometheus"

helm upgrade --install prometheus \
--namespace monitoring \
stable/prometheus-operator #\
# --values ../helm/prometheus_values.yaml \
# --values ../helm/alertmanager_values.yaml