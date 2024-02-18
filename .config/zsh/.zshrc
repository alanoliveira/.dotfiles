# interactive shell
typeset -g ZSH_SYSTEM_CLIPBOARD_TMUX_SUPPORT='true'

source "$ZDOTDIR/syntax-highlighting.zsh"
source "$ZDOTDIR/autosuggestion.zsh"
source "$ZDOTDIR/fzf.zsh"
source "$ZDOTDIR/aliases.zsh"
source "$ZDOTDIR/completions.zsh"
source "$ZDOTDIR/history.zsh"
source "$ZDOTDIR/vi-mode.zsh"
source "$ZDOTDIR/vi-mode-clipboard.zsh"

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval "$(direnv hook zsh)"
