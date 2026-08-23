# Azure App Service Deployment & Security Blueprint ☁️

Production-ready provisioning scripts, architecture configurations, and zero-downtime deployment slot workflows for **Azure App Service (Linux)** using the Azure CLI.

---

## 📖 Complete Documentation & Tutorial

This repository contains the CLI scripts and deployment manifests. For the complete architectural breakdown, slot swapping workflows, and managed identity RBAC integration, read the full tutorial on **DevStackHub**:

👉 **[Read the Full Azure App Service Guide on DevStackHub](https://devstackhub.tech/azure-app-service-deployment/)**

---

## 🛠️ Architecture Overview

- **Compute:** Dedicated Linux App Service Plan (`P1v3` tier for production workloads).
- **Zero-Downtime Deployments:** Blue-green staging deployment slots with instant traffic swaps.
- **Security Hardening:** Enforced TLS 1.2, HTTPS-only routing, and Azure System-Assigned Managed Identities.

```text
┌──────────────────────────────────────────────┐
│           Production Traffic (100%)          │
└──────────────────────┬───────────────────────┘
                       │
                       ▼
         ┌───────────────────────────┐
         │  Production Slot (Live)   │
         └─────────────▲─────────────┘
                       │  Swap
                       │  (0 Downtime)
         ┌─────────────▼─────────────┐
         │   Staging Slot (Testing)  │
         └───────────────────────────┘
```

**🚀 Quick Execution**
1. Authenticate with Azure CLI
```
Bash
az login
```
2. Run Deployment Script
```
Bash
chmod +x deploy.sh
./deploy.sh
```
3. Perform a Zero-Downtime Swap
```
Bash
chmod +x swap-slots.sh
./swap-slots.sh
```
## 🔗 Related Production Blueprints

- **[GitHub Actions CI/CD Pipeline Blueprint](https://devstackhub.tech/github-actions-cicd-guide/)**
- **[Production-Ready Docker Containers: 5 Optimization Strategies](https://devstackhub.tech/docker-containers-production-guide/)**
- **[Terraform on Azure: Infrastructure as Code Guide](https://devstackhub.tech/terraform-on-azure-iac-guide/)**

Maintained by DevStackHub.
