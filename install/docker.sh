yay -S --noconfirm --needed docker docker-compose docker-buildx nvidia-container-toolkit

# Limit log size to avoid running out of disk
sudo mkdir -p /etc/docker
echo '{"log-driver":"json-file","log-opts":{"max-size":"10m","max-file":"5"}}' | sudo tee /etc/docker/daemon.json

# Start Docker automatically
sudo systemctl enable docker
sudo systemctl enable containerd.service

# Give this user privileged Docker access
sudo usermod -aG docker ${USER}
