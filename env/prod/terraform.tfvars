rgs = {
  "rga" = {
    name     = "rg1"
    location = "eastus"
  }

  "rgb" = {
    name     = "rg2"
    location = "eastus"
  }


  "rgc" = {
    name     = "rg3"
    location = "eastus"
  }



}

vnets = {
  vneta = {
    name                = "vnet1"
    location            = "eastus"
    resource_group_name = "rg1"
    address_space       = ["10.0.0.0/16"]

  }
}

subnets = {
  subneta = {
    name                 = "frontend-subnet"
    resource_group_name  = "rg1"
    virtual_network_name = "vnet1"
    address_prefixes     = ["10.0.1.0/24"]
  }

  subnetb = {
    name                 = "backend-subnet"
    resource_group_name  = "rg1"
    virtual_network_name = "vnet1"
    address_prefixes     = ["10.0.2.0/24"]
  }
}

pips = {
  pipa = {
    name                = "frontend-pip"
    resource_group_name = "rg1"
    location            = "eastus"
    allocation_method   = "Static"
  }

  pipb = {
    name                = "backend-pip"
    resource_group_name = "rg1"
    location            = "eastus"
    allocation_method   = "Static"
  }

}

nics = {
  nica = {
    name                = "frontend-nic"
    location            = "eastus"
    resource_group_name = "rg1"
    datasubnet1         = "frontend-subnet"
    vnetname            = "vnet1"
    datapip1            = "frontend-pip"

  }

  nicb = {
    name                = "backend-nic"
    location            = "eastus"
    resource_group_name = "rg1"
    datasubnet1         = "backend-subnet"
    vnetname            = "vnet1"
    datapip1            = "backend-pip"

  }



}
vms = {
  vm1 = {
    name                = "frontend-vm"
    resource_group_name = "rg1"
    location            = "eastus"
    size                = "Standard_D2ds_v7"
    admin_username      = "shailendra1"
    admin_password      = "Ericsson@123"
    nic_name            = "frontend-nic"
    # kv_name         = "mykeyvault"
    # kv_secrets_name = "secret-1"


  }


  vm2 = {
    name                = "backend-vm"
    resource_group_name = "rg1"
    location            = "eastus"
    size                = "Standard_D2ds_v7"
    admin_username      = "shailendra2"
    admin_password      = "Ericsson@1234"
    nic_name            = "backend-nic"
    # kv_name         = "mykeyvault"
    # kv_secrets_name = "secret-2"




  }
}


