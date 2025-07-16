yay -S --noconfirm --needed \
  nvim tmux wget curl unzip inetutils \
  zsh zsh-autosuggestions zsh-syntax-highlighting zsh-completions \
  fd eza fzf ripgrep zoxide bat \
  fastfetch bottom man plocate less bandwhich \
  direnv starship gum openssh

sudo setcap cap_sys_ptrace,cap_dac_read_search,cap_net_raw,cap_net_admin+ep $(command -v bandwhich)
