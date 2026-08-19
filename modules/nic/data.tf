data "azurerm_subnet" "datasubnet" {
  for_each             = var.nics
  name                 = each.value.datasubnet1
  virtual_network_name = each.value.vnetname
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_public_ip" "datapip" {
  for_each            = var.nics
  name                = each.value.datapip1
  resource_group_name = each.value.resource_group_name
}
