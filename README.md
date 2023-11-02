# terraform-azure

![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)
![Azure](https://img.shields.io/badge/azure-%230072C6.svg?style=for-the-badge&logo=microsoftazure&logoColor=white)
![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white)
![PowerShell](https://img.shields.io/badge/PowerShell-%235391FE.svg?style=for-the-badge&logo=powershell&logoColor=white)
![GitHub Actions](https://img.shields.io/badge/github%20actions-%232671E5.svg?style=for-the-badge&logo=githubactions&logoColor=white)

Repository responsible for all azure related deployments. Azure deployments backed and managed by [terraform](https://www.terraform.io/) and orchestrated by [github actions](https://github.com/features/actions).

#### Custom Terraform Modules

- [WebApp Deployment](https://github.com/powellrhys/terraform-azure/tree/main/modules/webapp)

#### Azure Resources Provisioned by Terraform

- Azure Resource Group
- Azure App Service Plan
- Azure App Service

#### Deployed Resources 

- WebApp: [fantasy-premier-league-streamlit](https://fantasy-premier-league-streamlit.azurewebsites.net/)
- WebApp: [tf-number-classification](https://tf-number-classification.azurewebsites.net/)