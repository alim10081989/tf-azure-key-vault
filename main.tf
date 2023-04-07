resource "random_pet" "rg_name" {
  prefix = var.resource_group_name_prefix
}

resource "random_pet" "kv_name" {
  prefix = var.kv_name_prefix
}

resource "azurerm_resource_group" "rg" {
  location = var.resource_group_location
  name     = random_pet.rg_name.id
  tags = {
    Application = "Terraform"
    Purpose     = "KeyVault"
    Type        = "ResourceGroup"
  }
}

data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "key-vault" {
  name                            = random_pet.kv_name.id
  location                        = var.kv_location
  resource_group_name             = azurerm_resource_group.rg.name
  enabled_for_deployment          = var.kv_enabled_for_deployment
  enabled_for_disk_encryption     = var.kv_enabled_for_disk_encryption
  enabled_for_template_deployment = var.kv_enabled_for_template_deployment
  sku_name                        = var.kv_sku_name
  soft_delete_retention_days      = 7
  purge_protection_enabled        = false
  tenant_id                       = data.azurerm_client_config.current.tenant_id
  tags = {
    Application = "Terraform"
    Purpose     = "KeyVaultCheck"
    Type        = "KeyVault"
  }

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions         = ["Create", "Get", "List", "Purge", "Recover", ]
    secret_permissions      = ["Get", "List", "Purge", "Recover", "Set", "Delete", ]
    certificate_permissions = ["Create", "Get", "List", "Purge", "Recover", "Update"]
    storage_permissions     = ["Get", "List", "Purge", "Recover", "Backup", "Update"]
  }
}

resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "azurerm_key_vault_secret" "key-vault-secret" {
  name         = var.kv_secret_name
  value        = random_password.password.result
  key_vault_id = azurerm_key_vault.key-vault.id
}
