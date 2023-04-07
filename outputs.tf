output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "key_vault_name" {
  value = azurerm_key_vault.key-vault.name
}

output "key_vault_uri" {
  value = azurerm_key_vault.key-vault.vault_uri
}

output "key_vault_secret_name" {
  value = azurerm_key_vault_secret.key-vault-secret.name
}

output "key_vault_secret_value" {
  value     = azurerm_key_vault_secret.key-vault-secret.value
  sensitive = true
}
