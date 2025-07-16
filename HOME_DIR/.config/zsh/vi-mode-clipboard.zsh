function wrap_clipboard_widgets() {
  # NB: Assume we are the first wrapper and that we only wrap native widgets
  # See zsh-autosuggestions.zsh for a more generic and more robust wrapper
  local verb="$1"
  shift

  local widget
  local wrapped_name
  for widget in "$@"; do
    wrapped_name="_zsh-vi-${verb}-${widget}"
    if [ "${verb}" = copy ]; then
      eval "
        function ${wrapped_name}() {
          zle .${widget}
          printf %s \"\${CUTBUFFER}\" | wl-copy 2>/dev/null || true
        }
      "
    else
      eval "
        function ${wrapped_name}() {
          CUTBUFFER=\"\$(wl-paste 2>/dev/null || echo \$CUTBUFFER)\"
          zle .${widget}
        }
      "
    fi
    zle -N "${widget}" "${wrapped_name}"
  done
}

wrap_clipboard_widgets copy \
    vi-yank vi-yank-eol vi-yank-whole-line \
    vi-change vi-change-eol vi-change-whole-line \
    vi-kill-line vi-kill-eol vi-backward-kill-word \
    vi-delete vi-delete-char vi-backward-delete-char

wrap_clipboard_widgets paste \
    vi-put-{before,after}

unfunction wrap_clipboard_widgets
