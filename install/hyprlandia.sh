yay -S --noconfirm --needed \
  hyprland hyprshot hyprpicker hyprlock hypridle hyprpolkitagent hyprland-qtutils \
  swaybg waybar mako xdg-desktop-portal-hyprland xdg-desktop-portal-gtk \
  walker-bin libqalculate wtype wev \
  nwg-displays libnewt hyprsunset uwsm

# disable iwgtk tray icon
[[ -f /etc/xdg/autostart/iwgtk-indicator.desktop ]] || sudo rm /etc/xdg/autostart/iwgtk-indicator.desktop
