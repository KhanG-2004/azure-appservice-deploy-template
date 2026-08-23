#!/bin/bash
# Azure App Service Production Deployment Script
# Maintained by DevStackHub (https://devstackhub.tech)

set -e

# Configuration Variables
RESOURCE_GROUP="rg-production-apps"
LOCATION="eastus"
PLAN_NAME="plan-enterprise-linux"
APP_NAME="app-devstack-api-$RANDOM" # Ensures unique global name
SKU="P1v3"
RUNTIME="NODE:20-lts"

echo "=== 1. Creating Resource Group ==="
az group create --name $RESOURCE_GROUP --location $LOCATION

echo "=== 2. Provisioning App Service Plan (Linux) ==="
az appservice plan create \
  --name $PLAN_NAME \
  --resource-group $RESOURCE_GROUP \
  --sku $SKU \
  --is-linux

echo "=== 3. Provisioning Web App Instance ==="
az webapp create \
  --resource-group $RESOURCE_GROUP \
  --plan $PLAN_NAME \
  --name $APP_NAME \
  --runtime $RUNTIME

echo "=== 4. Enforcing HTTPS & TLS 1.2 Security ==="
az webapp update \
  --resource-group $RESOURCE_GROUP \
  --name $APP_NAME \
  --https-only true \
  --min-tls-version 1.2

echo "=== 5. Creating Staging Deployment Slot ==="
az webapp deployment slot create \
  --resource-group $RESOURCE_GROUP \
  --name $APP_NAME \
  --slot staging

echo "=== 6. Enabling System-Assigned Managed Identity ==="
az webapp identity assign \
  --resource-group $RESOURCE_GROUP \
  --name $APP_NAME

echo "Deployment finished successfully. App Name: $APP_NAME"
