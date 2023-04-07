variable "resource_group_location" {
  default     = "eastus"
  description = "Location of the resource group."
}

variable "resource_group_name_prefix" {
  default     = "rg"
  description = "Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription."
}

variable "kv_name_prefix" {
  description = "Prefix of the azure key vault thats combined with a random ID so name is unique in your Azure subscription"
  default     = "kv"
}

variable "kv_location" {
  description = "Azure Key Vault Location"
  default     = "westus"
}

variable "kv_enabled_for_deployment" {
  description = "Azure Key Vault Enabled for Deployment"
  default     = "true"
}

variable "kv_enabled_for_disk_encryption" {
  description = "Azure Key Vault Enabled for Disk Encryption"
  default     = "true"
}

variable "kv_enabled_for_template_deployment" {
  description = "Azure Key Vault Enabled for Deployment"
  default     = "true"
}

variable "kv_sku_name" {
  description = "Azure Key Vault SKU (Standard or Premium)"
  default     = "standard"
}

variable "kv_secret_name" {
  description = "Azure Key Vault Secret Name"
  default     = "vm-password"
}

variable "kv_secret_value" {
  description = "Azure Key Vault Secret Value"
  default     = "TerraformSecret"
}
