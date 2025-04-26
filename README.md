Week 1

1. Ansible geïnstalleerd via WSL:

sudo apt update
sudo apt install ansible -y

2. Maak een nieuwe directory/project:

mkdir esxi-ansible
cd esxi-ansible


3. Maak een simpel Ansible Inventory bestand:

touch inventory
Voeg dit toe om ESXi te pingen:
[esxi]
192.168.1.3 ansible_user=root ansible_ssh_pass=Welkom01! ansible_connection=ssh


4. Maak een Ansible configuratiebestand aan (optioneel maar handig):
touch ansible.cfg
Inhoud:
[defaults]
inventory = ./inventory
host_key_checking = False


5. Installeer sshpass zodat Ansible wachtwoorden kan gebruiken:
sudo apt install sshpass -y


6. Test de verbinding
ansible esxi -m ping
