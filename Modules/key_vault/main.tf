resource "azurerm_key_vault" "kv" {

  for_each = var.key_vaults

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.rg
  tenant_id           = each.value.tenant_id

  sku_name = each.value.sku_name

  soft_delete_retention_days = each.value.soft_delete_retention_days

  purge_protection_enabled = each.value.purge_protection_enabled

  rbac_authorization_enabled = true

}
resource "azurerm_key_vault_secret" "vm_password" {
  for_each = key_vaults

  name         = each.value.password_name
  value        = each.value.value
  key_vault_id = azurerm_key_vault.kv["kv1"].id
  
}

