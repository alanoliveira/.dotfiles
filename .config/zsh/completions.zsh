# The following lines were added by compinstall
zstyle ':completion:*' completer _expand _complete _ignored
zstyle :compinstall filename "$ZDOTDIR/zshrc.d/completions.zsh"

autoload -Uz compinit
compinit
# End of lines added by compinstall