yay -S --noconfirm --needed \
  imagemagick ctags \
  mariadb-libs postgresql-libs \
  github-cli mise rustup \
  lazygit lazydocker-bin jq

for f in $(dirname ${BASH_SOURCE[0]})/development/*.sh; do
  echo -e "\nRunning installer: $f"
  source "$f"
done
