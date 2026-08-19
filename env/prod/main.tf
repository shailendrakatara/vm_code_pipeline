module "resource_group" {
  source = "../../modules/azurerm_resource_group"
  rgs    = var.rgs
}

module "vnet" {
  depends_on = [module.resource_group]
  source     = "../../modules/vnet"
  vnets      = var.vnets
}

module "subnet" {
  depends_on = [module.vnet]
  source     = "../../modules/subnet"
  subnets    = var.subnets
}

module "pip" {
  depends_on = [module.resource_group]
  source     = "../../modules/public_ip"
  pips       = var.pips
}

module "nic" {
  depends_on = [module.subnet, module.pip]
  source     = "../../modules/nic"
  nics       = var.nics
}




module "vm" {
  depends_on = [module.nic]
  source     = "../../modules/virtual_machine"
  vms        = var.vms

}

