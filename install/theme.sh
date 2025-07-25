# Use dark mode for QT apps too (like kdenlive)
sudo pacman -S --noconfirm --needed kvantum-qt5

# Prefer dark mode everything
sudo pacman -S --noconfirm --needed gnome-themes-extra # Adds Adwaita-dark theme
gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-dark"
gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"
