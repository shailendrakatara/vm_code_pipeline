

data "azurerm_network_interface" "nic" {
  for_each            = var.vms
  name                = each.value.nic_name
  resource_group_name = each.value.resource_group_name
}


# data "azurerm_key_vault" "kv" {
#   for_each = var.vms
#   name                = each.value.kv_name
#   resource_group_name = each.value.resource_group_name

# }

# data "azurerm_key_vault_secret" "vm_pass" {
#   for_each = var.vms
#   name         = each.value.kv_secrets_name
#   key_vault_id = data.azurerm_key_vault.kv[each.key].id
# }


resource "azurerm_linux_virtual_machine" "vm" {
  for_each            = var.vms
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = each.value.size
  admin_username      = each.value.admin_username
  admin_password      = each.value.admin_password
  #admin_password = data.azurerm_key_vault_secret.vm_pass[each.key].value
  disable_password_authentication = false
  network_interface_ids = [
    data.azurerm_network_interface.nic[each.key].id,
  ]


  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }
}