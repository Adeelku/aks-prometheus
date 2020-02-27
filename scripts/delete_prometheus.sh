##!/usr/bin/env bash

echo "Deleting Prometheus"
helm delete prometheus --purge
kubectl -n monitoring delete crd --all
kubectl delete namespace monitoring --cascade=true
