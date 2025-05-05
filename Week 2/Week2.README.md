# Week 2

## 2.1 Gebruik gemaakt van deze bron om Terraform te installeren:

[Installeren van Terraform via YouTube](https://www.youtube.com/watch?v=Vt_Wd_tYFco)

---

## 2.2 Providers.tf gemaakt

```hcl
terraform {
  required_providers {
    esxi = {
      source = "registry.terraform.io/josenk/esxi"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "esxi" {
  esxi_hostname = "192.168.1.3"
  esxi_hostport = "22"
  esxi_hostssl  = "443"
  esxi_username = "root"
  esxi_password = "Welkom01!"
}

provider "azurerm" {
  resource_provider_registrations = "none"
  subscription_id                = "c064671c-8f74-4fec-b088-b53c568245eb"
  features {}
}


# 2.3  Opdracht 1A  :

(ESXi) Maak een terraform manifest voor 1 Ubuntu VM met 1 vcpu en 1024MB geheugen. Je zult zien dat de VM start en dat via de remote console van ESXi een prompt kunt zien. Maar je kunt er nog niks mee… Daarom mag je de VM verwijderen. De code bewaar je wel.

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

#   2.3  Opdracht 1B  :
(Azure) Maak een terraform manifest voor 1 Ubuntu VM, gebaseerd op de Standard_B2ats_v2 sizing.

