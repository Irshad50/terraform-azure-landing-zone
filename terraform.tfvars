rg_aqi = {

  rg1 = {

    name     = "rg_eri1"
    location = "eastus"
  }
  rg2 = {

    name     = "rg_eri2"
    location = "centralindia"
  }
}

honysaqi = {

  stae1 = {

    name                     = "eric1u9storage"
    location                 = "eastus"
    resource_group_key       = "rg1"
    account_tier             = "Standard"
    account_replication_type = "GRS"
  }

  stae2 = {

    name                     = "eric2u9wstorage"
    location                 = "centralindia"
    resource_group_key       = "rg2"
    account_tier             = "Standard"
    account_replication_type = "GRS"
  }
}


vnets = {

  vnet1 = {

    name               = "dev_vnet"
    location           = "centralindia"
    resource_group_key = "rg2"
    address_space      = ["10.0.0.0/16"]
  }
}

subnets = {

  subnet1 = {
    name     = "web-subnet"
    vnet_key = "vnet1"
    prefixes = ["10.0.1.0/24"]
  }
}

nsgs = {

  nsg1 = {
    name               = "web-nsg"
    resource_group_key = "rg2"
    location           = "centralindia"
  }
}

public_ips = {

  pip1 = {
    name               = "web-pip"
    resource_group_key = "rg2"
    location           = "centralindia"
  }
}

nics = {

  nic1 = {
    name       = "web-nic"
    rg_key     = "rg2"
    location   = "centralindia"
    subnet_key = "subnet1"
    pip_key    = "pip1"
  }
 nic2 = {
    name       = "web-nic-2"
    rg_key     = "rg2"
    location   = "centralindia"
    subnet_key = "subnet1"
    pip_key    = "pip2"
  }
}
}

vms = {

  vm1 = {
    name     = "webvm01"
    rg_key   = "rg2"
    location = "centralindia"
    nic_key  = "nic1"
    size     = "Standard_D2s_V3"
  }
  vm2 = {
    name     = "webvm02"
    rg_key   = "rg2"
    location = "centralindia"
    nic_key  = "nic2"
    size     = "Standard_D2s_V3"
  }
}
