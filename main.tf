resource "azurerm_resource_group" "rg_iq" {
  for_each = var.rg_aqi

  name     = each.value.name
  location = each.value.location
}

resource "azurerm_storage_account" "storage_iq" {
  for_each                 = var.honysaqi
  name                     = each.value.name
  location                 = each.value.location
  resource_group_name      = azurerm_resource_group.rg_iq[each.value.resource_group_key].name
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type
}

resource "azurerm_virtual_network" "iq_vnets" {

  for_each = var.vnets

  name = each.value.name

  resource_group_name = azurerm_resource_group.rg_iq[each.value.resource_group_key].name

  location = each.value.location

  address_space = each.value.address_space
}

resource "azurerm_subnet" "iq-subnet" {

  for_each = var.subnets

  name = each.value.name

  virtual_network_name = azurerm_virtual_network.iq_vnets[each.value.vnet_key].name

  resource_group_name = azurerm_virtual_network.iq_vnets[each.value.vnet_key].resource_group_name

  address_prefixes = each.value.prefixes
}

resource "azurerm_network_security_group" "iq-nsg" {

  for_each = var.nsgs

  name = each.value.name

  resource_group_name = azurerm_resource_group.rg_iq[each.value.resource_group_key].name

  location = each.value.location
}

resource "azurerm_public_ip" "iq-pip" {

  for_each = var.public_ips

  name = each.value.name

  resource_group_name = azurerm_resource_group.rg_iq[each.value.resource_group_key].name

  location = each.value.location

  allocation_method = "Static"
}

resource "azurerm_network_interface" "iq-nic" {

  for_each = var.nics

  name                = each.value.name
  resource_group_name = azurerm_resource_group.rg_iq[each.value.rg_key].name
  location            = each.value.location

  ip_configuration {
    name = "internal"

    subnet_id = azurerm_subnet.iq-subnet[each.value.subnet_key].id

    public_ip_address_id = azurerm_public_ip.iq-pip[each.value.pip_key].id

    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "iq-vm" {

  for_each = var.vms

  name = each.value.name

  resource_group_name = azurerm_resource_group.rg_iq[each.value.rg_key].name

  location = each.value.location

  size = each.value.size

  admin_username = "azureaqsa"

  network_interface_ids = [
  azurerm_network_interface.iq-nic[each.value.nic_key].id
]

  admin_password = "Aqsa@91501"

  disable_password_authentication = false

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}
