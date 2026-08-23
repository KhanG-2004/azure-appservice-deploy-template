#!/bin/bash
# Zero-Downtime Slot Swap Execution
# Maintained by DevStackHub (https://devstackhub.tech)

RESOURCE_GROUP="rg-production-apps"
APP_NAME="app-devstack-api"

echo "Executing zero-downtime traffic swap from staging to production..."

az webapp deployment slot swap \
  --resource-group $RESOURCE_GROUP \
  --name $APP_NAME \
  --slot staging \
  --target-slot production

echo "Traffic swap complete."
