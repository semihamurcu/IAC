# Week 2

## 2.1 Gebruik gemaakt van deze bron om Terraform te installeren:

[Installeren van Terraform via YouTube](https://www.youtube.com/watch?v=Vt_Wd_tYFco)

Achteraf heb ik alles opnieuw moeten doen want WSL werkt niet.

Stappen van installatie gevolgd van brightspace

2.2 Providers.tf gemaakt -> Zie hiervoor providers.tf


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


Eindresultaat = 

![alt text](<1A SS-1.png>)

#   2.3  Opdracht 1B  :
(Azure) Maak een terraform manifest voor 1 Ubuntu VM, gebaseerd op de Standard_B2ats_v2 sizing.


