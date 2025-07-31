if [[ ! -f /etc/pacman.d/hooks/caddy-set-cap-net-bind-service.hook ]]; then
  echo "Adding pacman hook to set CAP_NET_BIND_SERVICE for caddy"

  mkdir -p /etc/pacman.d/hooks/
  tee /etc/pacman.d/hooks/caddy-set-cap-net-bind-service.hook >/dev/null <<EOF
[Trigger]
Operation = Install
Operation = Upgrade
Type = Package
Target = caddy

[Action]
Description = set CAP_NET_BIND_SERVICE
When = PostTransaction
Exec = /usr/bin/setcap cap_net_bind_service=+ep /usr/bin/caddy
EOF


yay -S --noconfirm --needed caddy

if [[ ! -f $XDG_CONFIG_HOME/caddy/Caddyfile ]]; then
  mkdir -p $XDG_CONFIG_HOME/caddy
  tee $XDG_CONFIG_HOME/caddy/Caddyfile >/dev/null <<EOF
{
	default_bind 127.0.0.1
	http_port    80
	https_port   443
	admin        off
	auto_https   off
}

# http://awesomeapp.localhost {
# 	reverse_proxy 0.0.0.0:3050
# }
EOF
fi

echo "Registering the caddy.local.service"

if [[ ! -f $XDG_CONFIG_HOME/systemd/user/caddy.local.service ]]; then
  mkdir -p $XDG_CONFIG_HOME/systemd/user/caddy.local.service
  tee $XDG_CONFIG_HOME/systemd/user/caddy.local.service >/dev/null <<EOF
[Unit]
Description=Caddy web server (user)
Documentation=https://caddyserver.com/docs/
After=network-online.target

[Service]
Type=notify
ExecStartPre=/usr/bin/caddy validate --config ${XDG_CONFIG_HOME}/caddy/Caddyfile
ExecStart=/usr/bin/caddy run --environ --config ${XDG_CONFIG_HOME}/caddy/Caddyfile
ExecReload=/usr/bin/caddy reload --config ${XDG_CONFIG_HOME}/caddy/Caddyfile --force
Restart=on-abnormal
TimeoutStopSec=5s

[Install]
WantedBy=default.target
EOF
fi

systemctl --user daemon-reload
systemctl --user enable caddy.local.service
