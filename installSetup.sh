#!/bin/bash
# ==============================================================================
# This is a installation Setup for the IOT project on Ubuntu systems.
# It installs prerequisites like Vagrant, libvirt, and NFS.
# ==============================================================================

##### Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color
##### Colors for output END

##### PREREQUISITES INSTALLATION
sudo apt update && sudo apt upgrade -y
sudo apt install -y build-essential git curl
##### PREREQUISITES INSTALLATION END


##### VAGRANT INSTALLATION
if ! command -v vagrant >/dev/null 2>&1; then
    echo -e "${YELLOW}Vagrant is not installed. Proceeding with installation.${NC}"
    wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
    sudo apt update && sudo apt install -y vagrant
else
    echo -e "${GREEN}Vagrant is already installed: $(vagrant --version)${NC}"
fi
##### VAGRANT INSTALLATION END

##### LIBVIRT INSTALLATION
echo -e "${YELLOW}Installing libvirt and related packages...${NC}"
sudo apt install -y libvirt-dev libvirt-daemon-system libvirt-clients qemu-kvm qemu-system qemu-utils
sudo usermod -aG libvirt $USER
sudo usermod -aG libvirt $(whoami)
sudo systemctl enable --now libvirtd
##### LIBVIRT INSTALLATION END

###### INSTALLATION OF VAGRANT-LIBVIRT PLUGIN
echo -e "${YELLOW}Installing vagrant-libvirt plugin...${NC}"
sudo apt-get install -y ebtables libguestfs-tools
sudo apt-get install -y ruby-fog-libvirt
sg libvirt -c "vagrant plugin install vagrant-libvirt"
##### VAGRANT-LIBVIRT INSTALLATION END

##### NFS INSTALLATION
echo -e "${YELLOW}Installing NFS packages...${NC}"
sudo apt-get install -y nfs-common nfs-kernel-server
##### NFS INSTALLATION END

newgrp libvirt#!/bin/bash
# ==============================================================================
# This is a installation Setup for the IOT project on Ubuntu systems.
# It installs prerequisites like Vagrant, libvirt, and NFS.
# ==============================================================================

##### Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color
##### Colors for output END

##### PREREQUISITES INSTALLATION
sudo apt update && sudo apt upgrade -y
sudo apt install -y build-essential git curl
##### PREREQUISITES INSTALLATION END


##### VAGRANT INSTALLATION
if ! command -v vagrant >/dev/null 2>&1; then
    echo -e "${YELLOW}Vagrant is not installed. Proceeding with installation.${NC}"
    wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
    sudo apt update && sudo apt install -y vagrant
else
    echo -e "${GREEN}Vagrant is already installed: $(vagrant --version)${NC}"
fi
##### VAGRANT INSTALLATION END

##### LIBVIRT INSTALLATION
echo -e "${YELLOW}Installing libvirt and related packages...${NC}"
sudo apt install -y libvirt-dev libvirt-daemon-system libvirt-clients qemu-kvm qemu-system qemu-utils
sudo usermod -aG libvirt $USER
sudo usermod -aG libvirt $(whoami)
sudo systemctl enable --now libvirtd
##### LIBVIRT INSTALLATION END

###### INSTALLATION OF VAGRANT-LIBVIRT PLUGIN
echo -e "${YELLOW}Installing vagrant-libvirt plugin...${NC}"
sudo apt-get install -y ebtables libguestfs-tools
sudo apt-get install -y ruby-fog-libvirt
sg libvirt -c "vagrant plugin install vagrant-libvirt"
##### VAGRANT-LIBVIRT INSTALLATION END

##### NFS INSTALLATION
echo -e "${YELLOW}Installing NFS packages...${NC}"
sudo apt-get install -y nfs-common nfs-kernel-server
##### NFS INSTALLATION END

newgrp libvirt
