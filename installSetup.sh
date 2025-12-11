
sudo apt update
sudo apt install build-essential git


#install vagrant
wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install vagrant

#libvirt
sudo apt install libvirt-daemon-system libvirt-clients bridge-utils
#permissions
sudo usermod -aG libvirt $USER
newgrp libvirt

#install provider vagrant-libvirt
sudo apt-get purge vagrant-libvirt
sudo apt-mark hold vagrant-libvirt
sudo apt-get install -y qemu libvirt-daemon-system libvirt-dev ebtables libguestfs-tools
sudo apt-get install -y vagrant ruby-fog-libvirt
vagrant plugin install vagrant-libvirt

#nfs install
sudo apt-get install nfs-common nfs-kernel-server
