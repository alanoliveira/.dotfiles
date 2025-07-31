yay -S --noconfirm --needed \
  nvim tmux wget curl unzip inetutils \
  zsh zsh-autosuggestions zsh-syntax-highlighting zsh-completions \
  fd eza fzf ripgrep zoxide bat \
  fastfetch bottom man plocate less \
  direnv starship gum openssh

for f in $(dirname ${BASH_SOURCE[0]})/terminal/*.sh; do
  echo -e "\nRunning installer: $f"
  source "$f"
done
