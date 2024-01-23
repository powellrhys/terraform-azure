output "sql_server_password" {
    value = azurerm_sql_server.sql_server.administrator_login_password
}

output "sql_server_username" {
    value = azurerm_sql_server.sql_server.administrator_login
}