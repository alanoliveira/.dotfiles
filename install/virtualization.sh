sudo pacman -S --noconfirm --needed qemu-full virt-manager dnsmasq
sudo systemctl enable libvirtd.service
sudo usermod -aG libvirt ${USER}
