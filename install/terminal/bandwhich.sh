if [[ ! -f /etc/pacman.d/hooks/bandwhich-set-caps.hook ]]; then
  echo "Adding pacman hook to set CAP_SYS_PTRACE,CAP_DAC_READ_SEARCH,CAP_NET_RAW,CAP_NET_ADMIN for bandwhich"

  sudo mkdir -p /etc/pacman.d/hooks/
  sudo tee /etc/pacman.d/hooks/bandwhich-set-caps.hook >/dev/null <<EOF
[Trigger]
Operation = Install
Operation = Upgrade
Type = Package
Target = bandwhich

[Action]
Description = set bandwhich caps
When = PostTransaction
Exec = /usr/bin/setcap CAP_SYS_PTRACE,CAP_DAC_READ_SEARCH,CAP_NET_RAW,CAP_NET_ADMIN+ep /usr/bin/bandwhich
EOF
fi

yay -S --noconfirm --needed bandwhich
