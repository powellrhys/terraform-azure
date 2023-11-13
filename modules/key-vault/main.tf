resource "azurerm_key_vault" "key_vault" {
  name                        = var.key_vault_name
  location                    = var.key_vault_location
  resource_group_name         = var.key_vault_resource_group_name
  enabled_for_disk_encryption = true
  tenant_id                   = var.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false
  
  sku_name = "standard"

  access_policy {
    tenant_id = var.tenant_id
    object_id = var.object_id
    key_permissions = var.permissions
    secret_permissions = var.permissions
  }
}

