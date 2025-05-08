#Esxi

resource "esxi_guest" "vm_opdracht_1A_Semih" {
  guest_name     = "vm_opdracht_1A_Semih"  # Naam van de VM zoals aangegeven in de opdracht
  disk_store     = "datastore1"
  ovf_source     = "https://cloud-images.ubuntu.com/releases/24.04/release/ubuntu-24.04-server-cloudimg-amd64.ova"  # Ubuntu Cloud Image

  numvcpus       = 1                           # Aantal vCPUs, zoals gevraagd in de opdracht
  memsize        = 1024                        # 1024MB geheugen
  guest_id       = "ubuntu64Guest"             # Specifieke guest OS identificatie voor Ubuntu

  network_interfaces {
    virtual_network = "VM Network"             # Het netwerk waaraan de VM wordt gekoppeld
  }

  disk {
    size = 10                                    # Schijfgrootte in GB, je kunt dit verder aanpassen als het groter moet zijn
  }
}




# Azure

# Create a virtual network
resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-ubuntu"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = var.resource_group_name
}

# Create a subnet within the VNet
resource "azurerm_subnet" "subnet" {
  name                 = "subnet-ubuntu"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

# Create a public IP address
resource "azurerm_public_ip" "public_ip" {
  name                = "ubuntu-public-ip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"
  sku                 = "Basic"
}

# Create a network interface and associate with subnet and public IP
resource "azurerm_network_interface" "nic" {
  name                = "ubuntu-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip.id
  }
}

# Create the Ubuntu VM
resource "azurerm_linux_virtual_machine" "ubuntu_vm" {
  name                = "ubuntu-vm"
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = "Standard_B2ats_v2"
  admin_username      = "semih"
  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]

  # Gebruik jouw eigen SSH key
  admin_ssh_key {
    username   = "semih"
    public_key = file("/home/student/.ssh/azure.pub")
  }

  disable_password_authentication = true

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
