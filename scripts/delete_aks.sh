##!/usr/bin/env bash
RG_NAME="AdventCalendar" # Change to the Resource Groupe Name
echo "Deleting Resource Group $RG_NAME" 
az group delete --name $RG_NAME -y
