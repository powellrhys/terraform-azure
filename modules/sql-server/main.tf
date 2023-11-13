resource "time_rotating" "admin_password" {
  rotation_months = var.admin_password_rotation_months
}

resource "random_password" "admin_password" {
  length      = 20
  min_numeric = 2
  min_upper   = 2
  min_lower   = 2
  special     = false
  keepers = {
    time = time_rotating.admin_password.id
  }
}

resource "azurerm_sql_server" "sql_server" {
  name                         = var.sql_server_name
  resource_group_name          = var.sql_server_resource_group_name
  location                     = var.sql_server_location
  version                      = "12.0"
  administrator_login          = "sqladmin"
  administrator_login_password = random_password.admin_password.result
}

resource "azurerm_sql_database" "sql_database" {
  name                = var.sql_server_database_name
  resource_group_name = var.sql_server_resource_group_name
  location            = var.sql_server_location
  server_name         = azurerm_sql_server.sql_server.name
  edition             = "Free"
}
