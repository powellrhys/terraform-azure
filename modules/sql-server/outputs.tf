output "sql_server_password" {
    value = azurerm_sql_server.sql_server.administrator_login_password
}

output "sql_server_username" {
    value = azurerm_sql_server.sql_server.administrator_login
}

output "sql_server_name" {
    value = azurerm_sql_server.sql_server.fully_qualified_domain_name
}

output "sql_server_database" {
    value = azurerm_sql_database.sql_database.name
}
