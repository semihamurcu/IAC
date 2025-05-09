# 2.1 Bronnen

https://chatgpt.com/share/681cb3c0-52b4-8002-9184-8180f7d01dc2


# 2.2 Bestandenstructuur en toelichting
🔹 variables.tf
In dit bestand definieer je de variabelen die gebruikt worden in de Terraform-configuratie.
Deze aanpak maakt de configuratie flexibel en herbruikbaar, zonder dat je vaste (hardcoded) waarden in je main.tf hoeft te zetten.

🔹 terraform.tfvars
In dit bestand ken je specifieke waarden toe aan de variabelen uit variables.tf.
Bijvoorbeeld de naam van de resource group, locatie en pad naar je SSH-sleutel. Hierdoor is je code makkelijk aan te passen zonder de hoofdbestanden te wijzigen.

🔹 providers.tf
Hier geef je aan welke provider(s) Terraform moet gebruiken.
In dit geval zijn dat:

azurerm voor Microsoft Azure

(eventueel) esxi als je lokaal met een hypervisor werkt

Ook definieer je hier de authenticatiegegevens of verwijs je naar een lokale configuratie.

🔹 main.tf
Dit is het hoofdscript waarin alle resources gedefinieerd worden:

* Virtual Network (VNet)
* Subnet
* Public IP-adressen
* Network Interfaces
* Virtual Machines
* CloudInit-configuratie
* Eventuele lokale outputs zoals IP-adressen in een .txt bestand

🔹 public_ips.txt (gegenereerd)
Wordt door Terraform gegenereerd met de publieke IP-adressen van de aangemaakte VM’s.
Handig voor documentatie of om makkelijk verbinding te maken.



# B. (Azure) Maak 1 terraform manifest waarin je 2 Ubuntu 24.04 VM in Azure deployed met de volgende kenmerken:

De VM is van het type “Standard_B2ats_v2”
Je eerder geuploade SSH key wordt gebruikt.
Je VM heeft een publiek IP adres
Je maakt de user ‘iac’ aan.
Via CloudInit wordt er een bestand ‘hello.txt’ in /home/iac geplaatst met de inhoud ‘Hello World’
Het ip adres van elke machine komt in een bestand op je beheer systeem.
Het moet dus 1 manifest zijn waarin 2 dezelfde VM’s aangemaakt worden.
Maak in je Terraform manifest gebruik van variabelen waar dit kan. Zet deze variabelen in een apart bestand.

Eindresultaat = 

<video controls src="2B Resultaat .mp4" title="Title"></video>

