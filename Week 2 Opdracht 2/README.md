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

Virtual Network (VNet)

Subnet

Public IP-adressen

Network Interfaces

Virtual Machines

CloudInit-configuratie

Eventuele lokale outputs zoals IP-adressen in een .txt bestand

🔹 outputs.tf (optioneel)
Geeft belangrijke resultaten van de deployment weer, zoals publieke IP-adressen van de VM’s, zodat je deze makkelijk kunt gebruiken of documenteren.

🔹 cloud-init/init.yaml (optioneel)
Bevat het CloudInit script dat wordt uitgevoerd tijdens de eerste boot van de VM’s.
Hiermee kun je bijvoorbeeld automatisch een bestand hello.txt aanmaken in /home/iac.

🔹 public_ips.txt (gegenereerd)
Wordt door Terraform gegenereerd met de publieke IP-adressen van de aangemaakte VM’s.
Handig voor documentatie of om makkelijk verbinding te maken.