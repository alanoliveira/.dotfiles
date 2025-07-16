if (( ! $+commands[fzf])); then
  return
fi

FZF_TMUX=1
FZF_CTRL_T_COMMAND='fd --type file --hidden --exclude .git'

_fzf_compgen_path() {
  fd --hidden --exclude ".git" "$1"
}

_fzf_compgen_dir() {
  fd --type d --hidden --exclude ".git" "$1"
}

[[ ! -f /usr/share/fzf/key-bindings.zsh ]] || source /usr/share/fzf/key-bindings.zsh
