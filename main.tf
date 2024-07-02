terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">3.0.0"
    }
  }
  backend "azurerm" {
    key = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "webapp_rg" {
  name     = "webapp-resource-group"
  location = "westeurope"
}

resource "azurerm_service_plan" "webapp_service_plan" {
  name                = "webapps"
  resource_group_name = azurerm_resource_group.webapp_rg.name
  location            = azurerm_resource_group.webapp_rg.location
  os_type             = "Linux"
  sku_name            = "F1"
}

module "fantasy-premier-league-backend" {
  source              = "./modules/webapp"
  web_app_name        = "fantasy-premier-league-backend"
  location            = azurerm_resource_group.webapp_rg.location
  resource_group_name = azurerm_resource_group.webapp_rg.name
  service_plan_id     = azurerm_service_plan.webapp_service_plan.id
  docker_image        = "powellrhys/fantasy-premier-league-streamlit-backend"
  docker_image_tag    = "latest"
  app_settings = {
    DOCKER_REGISTRY_SERVER_URL = "https://index.docker.io/v1"
    PORT                       = "8000"
    WEBSITES_PORT              = "8000"
    sql_server_name            = module.powellrhys-sql-server.sql_server_name
    sql_server_database        = module.powellrhys-sql-server.sql_server_database
    sql_server_username        = module.powellrhys-sql-server.sql_server_username
    sql_server_password        = module.powellrhys-sql-server.sql_server_password
    manager_id                 = var.fpl_manager_id
    leagues                    = var.fpl_league_ids
    password                   = var.fpl_password
  }
}

module "fantasy-premier-league-streamlit" {
  source              = "./modules/webapp"
  web_app_name        = "fantasy-premier-league-streamlit"
  location            = azurerm_resource_group.webapp_rg.location
  resource_group_name = azurerm_resource_group.webapp_rg.name
  service_plan_id     = azurerm_service_plan.webapp_service_plan.id
  docker_image        = "powellrhys/fantasy-premier-league-streamlit-frontend"
  docker_image_tag    = "latest"
  app_settings = {
    DOCKER_REGISTRY_SERVER_URL = "https://index.docker.io/v1"
    PORT                       = "8501"
    WEBSITES_PORT              = "8501"
    sql_server_name            = module.powellrhys-sql-server.sql_server_name
    sql_server_database        = module.powellrhys-sql-server.sql_server_database
    sql_server_username        = module.powellrhys-sql-server.sql_server_username
    sql_server_password        = module.powellrhys-sql-server.sql_server_password
    manager_id                 = var.fpl_manager_id
    leagues                    = var.fpl_league_ids
    password                   = var.fpl_password
  }
}

module "tf-number-classification" {
  source              = "./modules/webapp"
  web_app_name        = "tf-number-classification"
  location            = azurerm_resource_group.webapp_rg.location
  resource_group_name = azurerm_resource_group.webapp_rg.name
  service_plan_id     = azurerm_service_plan.webapp_service_plan.id
  docker_image        = "powellrhys/tf-number-classification"
  docker_image_tag    = "latest"
  app_settings = {
    DOCKER_REGISTRY_SERVER_URL = "https://index.docker.io/v1"
    PORT                       = "8501"
    WEBSITES_PORT              = "8501"
  }
}

module "train-delay" {
  source              = "./modules/webapp"
  web_app_name        = "train-delay"
  location            = azurerm_resource_group.webapp_rg.location
  resource_group_name = azurerm_resource_group.webapp_rg.name
  service_plan_id     = azurerm_service_plan.webapp_service_plan.id
  docker_image        = "powellrhys/train-delay"
  docker_image_tag    = "latest"
  app_settings = {
    DOCKER_REGISTRY_SERVER_URL = "https://index.docker.io/v1"
    PORT                       = "8501"
    WEBSITES_PORT              = "8501"
    account_username           = var.train_delay_username
    account_password           = var.train_delay_password
  }
}

resource "azurerm_resource_group" "sql_rg" {
  name     = "sql-resource-group"
  location = "West Europe"
}

module "powellrhys-sql-server" {
  source                         = "./modules/sql-server"
  sql_server_name                = "powellrhys-sql-server"
  sql_server_resource_group_name = azurerm_resource_group.sql_rg.name
  sql_server_location            = azurerm_resource_group.sql_rg.location
  sql_server_database_name       = "powellrhys-sql-database"
  admin_password_rotation_months = 6
}

resource "azurerm_resource_group" "kv_rg" {
  name     = "key-vault-group"
  location = "West Europe"
}

data "azurerm_client_config" "current" {}

module "powellrhys-key-vault" {
  source                        = "./modules/key-vault"
  key_vault_name                = "powellrhys-key-vault"
  key_vault_resource_group_name = azurerm_resource_group.kv_rg.name
  key_vault_location            = azurerm_resource_group.kv_rg.location
  tenant_id                     = data.azurerm_client_config.current.tenant_id
  object_id                     = data.azurerm_client_config.current.object_id
  permissions                   = ["Get", "List"]
}
