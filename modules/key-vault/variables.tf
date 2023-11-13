variable "key_vault_name" {
  description = "Name of Key Vault"
  type        = string
}

variable "key_vault_location" {
  description = "Key Vault Location"
  type        = string
}

variable "key_vault_resource_group_name" {
  description = "Key Vault Resource Group"
  type        = string
}

variable "tenant_id" {
  description = "Subscription Tenant ID"
  type        = string
}

variable "object_id" {
  description = "Subscription Object ID"
  type        = string
}

variable "permissions" {
  description = "Secret and Key permissions"
  type        = list
}
