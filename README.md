# Azure_Assign_Roles
Assigning RBAC roles to Azure RGs

* Author: **Shakeel Juan Calle Ghani**
* Creation Date: **Aug 2023**
* Version: **1.0**

### Pipeline Status
| Target  |  Status | 
| ------- |  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Users   | [![Build Status]()    |
| Groups  | [![Build Status]()    |

# Wiki for assigning RBAC roles

## Introduction

Assigning RBAC roles (Users & Groups)

----------- In dev ---------------
### Folder Templates

## PowerShell Files
The following are located in the **[./PowerShell]** folder.

* **[RBAC_Users.ps1](./RBAC_Users.ps1)**: PS file   
* **[RBAC_Groups.ps1](./RBAC_Groups.ps1)**: PS file

## Users
* **[Users.csv](./Users.csv)**: CSV insert to assign RBAC roles for Users.
* **[azure-pipelines.yml](./Users/Users.yml)**: YAML file

## Groups
* **[Groups.csv](./Groups.csv)**: CSV insert to assign RBAC roles for Groups.
* **[azure-pipelines.yml](./Groups/Groups.yml)**: YAML file

## Instructions

### Template Parameters

| Name | Type | Mandatory | Default Value | Description |
| ---- | ---- | --------- | ------------- | ----------- |
| location| string | No | Resource Group location | Azure location where the Azure Virtual Machine cluster will be created|
| virtualNetworkResourceGroupName | string | Yes | N/A | Resource group of Virtual Network |
| virtualNetworkName | string | Yes | N/A | Virtual Network name |
| subnetName | string | Yes | N/A | Subnet name |

### Azure Dev Ops Libraries (variable groups)
|  Library Name  | Enviroment | Description |
| -------------- | ---------- | ----------- |
| test-Bicep-VM  |    Test    | Parameters  |

### Prerequisites
1. Active Directory dedicated Organizational Unit for the VMs
2. Active Directory account with below permissions:           

####Note: Prerequisite Points 1, 2 & 3 are already in place, just keep domainFQDN & domainJoinUserName parameters in the library the same. If you are going to use a new SPN that is domain joined then all 3 have to be done. 

If any of the prerequisites are not met the deployment will either fail or not start at all.

### Deployment process

Azure Dev Ops using YMAML pipelines is utilized with usage of:
- [AzurePowerShell@5 task](https://learn.microsoft.com/en-us/azure/devops/pipelines/tasks/reference/azure-powershell-v5?view=azure-pipelines) to deploy the template with usage of service connection

The deployment pipeline has 2 parameters:
- Environment - environment of choice that defines which Variable Group will be used, that contains environment specific pre-defined parmaeters.

### Continuous Integration
If the environment needs to be cleared and re-deployed for whatever reason, below steps need to be taken before re-deployment attempt:
- Redeployment will fail unless this is all done accurately.
1. De
2. Delete 

### Manual configuration

### Changes
