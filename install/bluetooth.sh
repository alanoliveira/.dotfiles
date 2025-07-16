# Install bluetooth controls
yay -S --noconfirm --needed blueberry iwd

# Turn on bluetooth by default
sudo systemctl enable --now bluetooth.service
sudo systemctl enable --now iwd
