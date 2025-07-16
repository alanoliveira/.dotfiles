bindkey -v
KEYTIMEOUT=20
WORDCHARS=${WORDCHARS//\/}

function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[2 q';;
        viins|main) echo -ne '\e[6 q';;
    esac
}
zle -N zle-keymap-select

zle-line-init() {
    echo -ne "\e[6 q"
}
zle -N zle-line-init

bindkey -M viins '^F'    emacs-forward-word
bindkey -M viins '^B'    emacs-backward-word
bindkey -M viins '^P'    up-history
bindkey -M viins '^N'    down-history
bindkey -M viins '^A'    beginning-of-line
bindkey -M viins '^E'    end-of-line
bindkey -M viins '^?'    backward-delete-char
bindkey -M viins '^h'    backward-delete-char
bindkey -M viins '^w'    backward-kill-word
bindkey -M viins "^[[1~" beginning-of-line
bindkey -M viins "^[[4~" end-of-line
bindkey -M vicmd 'Y'     vi-yank-eol
bindkey -M vicmd 'K'     run-help
bindkey -M vicmd -r "+"
bindkey -M vicmd -r "\\-"

# Edit command line
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd 'v' edit-command-line

# Surrouding operators
autoload -U select-quoted select-bracketed surround
zle -N select-quoted
zle -N select-bracketed
zle -N delete-surround surround
zle -N add-surround surround
zle -N change-surround surround

for m in visual viopp; do
    for c in {a,i}{\',\",\`}; do
        bindkey -M $m $c select-quoted
    done
    for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
        bindkey -M $m $c select-bracketed
    done
done

bindkey -a cs change-surround
bindkey -a ds delete-surround
bindkey -a ys add-surround
bindkey -M visual S add-surround
