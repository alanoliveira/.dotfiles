yay -S --noconfirm --needed \
  hyprland hyprshot hyprpicker hyprlock hypridle hyprpolkitagent hyprland-qtutils \
  swaybg wofi wofi-emoji waybar mako xdg-desktop-portal-hyprland xdg-desktop-portal-gtk \
  nwg-displays uwsm libnewt

# disable iwgtk tray icon
[[ -f /etc/xdg/autostart/iwgtk-indicator.desktop ]] || sudo rm /etc/xdg/autostart/iwgtk-indicator.desktop
