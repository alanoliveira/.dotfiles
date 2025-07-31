autoload -U compinit && compinit -d $HOME/.zcompdump

compdef _gnu_generic fzf

if command -v zoxide &> /dev/null; then
  eval "$(op completion zsh)"
fi
