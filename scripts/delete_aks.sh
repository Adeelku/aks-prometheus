##!/usr/bin/env bash
RG_NAME="AdventCalendar"
echo "Deleting Resource Group $RG_NAME" 
az group delete --name $RG_NAME -y
