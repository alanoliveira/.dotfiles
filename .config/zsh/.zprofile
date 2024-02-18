# login shell
export EDITOR=nvim
export VISUAL=$EDITOR
export MANPAGER='nvim +Man!'
export PAGER="less -R"
export BROWSER=firefox
export RI="-f ansi"
export OVERMIND_TMUX_CONFIG=$HOME/.config/tmux/overmind.tmux.conf
export RUBYLIB="$HOME/rubygem_plugins:$RUBYLIB"
export CLOUD_DIR=$HOME/Cloud
[[ ! -f /opt/asdf-vm/asdf.sh ]] || source /opt/asdf-vm/asdf.sh
