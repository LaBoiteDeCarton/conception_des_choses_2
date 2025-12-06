vagrant destroy -f
virsh net-destroy vagrant-libvirt
virsh net-destroy dmercadiSW
virsh net-destroy dmercadiS

virsh net-undefine vagrant-libvirt
virsh net-undefine dmercadiSW
virsh net-undefine dmercadiS

rm -rf .vagrant
vagrant up