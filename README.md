# 🌐 Enterprise Azure Landing Zone & Governance

[![Azure](https://img.shields.io/badge/Microsoft%20Azure-Landing%20Zone-0078D4?style=for-the-badge&logo=microsoftazure&logoColor=white)](https://azure.microsoft.com/)
[![Terraform](https://img.shields.io/badge/Terraform-HCL-844FBA?style=for-the-badge&logo=terraform&logoColor=white)](https://www.terraform.io/)
[![CAF](https://img.shields.io/badge/Architecture-Cloud%20Adoption%20Framework-brightgreen?style=for-the-badge)](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)
[![Governance](https://img.shields.io/badge/Governance-Azure%20Policy%20%7C%20RBAC-blue?style=for-the-badge)](https://azure.microsoft.com/)

---

## 📌 Overview

This repository implements an **Enterprise Azure Landing Zone** aligned with the **Microsoft Cloud Adoption Framework (CAF)**. It establishes centralized management, governance, security guardrails, and network boundaries required to host enterprise workloads safely in Microsoft Azure.

### Key Architectural Pillars
* 🏢 **Management Group Hierarchy**: Structured organization of subscriptions into Core, Platform, and Landing Zones.
* 🛡️ **Azure Policy & Guardrails**: Automated enforcement of regulatory compliance, encryption, region restrictions, and tagging standards.
* 🔐 **Identity & Access Management**: Principle of Least Privilege via Azure RBAC, Privileged Identity Management (PIM), and Microsoft Entra ID integration.
* 🌐 **Connectivity & Hybrid Networking**: Centralized Hub network supporting Azure Firewall, Bastion, and ExpressRoute / VPN Gateways.
* 📊 **Centralized Observability**: Central Log Analytics Workspace collecting resource diagnostic logs and security event data.

---

## 🏛️ Landing Zone Hierarchy Blueprint

```mermaid
graph TD
    Root[👑 Tenant Root Management Group]
    Platform[🏢 Platform Management Group]
    Workloads[🚀 Landing Zones Management Group]
    Decom[📦 Decommissioned]
    Sandbox[🧪 Sandbox]

    Root --> Platform
    Root --> Workloads
    Root --> Decom
    Root --> Sandbox

    Platform --> MgmtSub[Management & Logging Sub]
    Platform --> ConnSub[Connectivity & Hub Sub]
    Platform --> SecSub[Security & KeyVault Sub]

    Workloads --> CoreWorkload[Corporate Apps / Spoke 1]
    Workloads --> OnlineWorkload[External Facing / Spoke 2]
```

---

## 🚀 Deployment Instructions

```bash
# 1. Initialize Terraform
terraform init

# 2. Review Execution Plan
terraform plan -out=landingzone.tfplan

# 3. Apply Landing Zone
terraform apply landingzone.tfplan
```

---

## 👨‍💻 Author

**Md Irshad Alam**  
*Senior Azure DevOps Engineer & Multi-Cloud Platform Architect*  
* 💼 **LinkedIn:** [linkedin.com/in/md-irshad-alam-0a5278220](https://www.linkedin.com/in/md-irshad-alam-0a5278220)  
* 📬 **Email:** `mdirshadalam91190@gmail.com`  
