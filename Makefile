SHELL := /bin/sh
ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
HOME:=${HOME}

all:
	@echo "Run things individually!"

nvim:
	@ln -nsf $(ROOT_DIR)/nvim ~/.config/nvim

tmux:
	@ln -fs "$(ROOT_DIR)/tmux/.tmux/.tmux.conf" "$(HOME)/"
	@ln -fs "$(ROOT_DIR)/tmux/.tmux.conf.local" "$(HOME)/"

fish:
	@ln -fs $(ROOT_DIR)/bash/.inputrc ~/.inputrc # rails console uses it
	@ln -fns $(ROOT_DIR)/fish ~/.config/fish

omf:
	@ln -fns $(ROOT_DIR)/omf ~/.config/omf

zsh:
	@ln -nfs "$(ROOT_DIR)/zsh/.zshrc" "$(HOME)/"
	@ln -fs "$(ROOT_DIR)/zsh/.zshrc.d" "$(HOME)/"

git:
	@ln -nfs "$(ROOT_DIR)/git/.git-templates" "$(HOME)/"
	@ln -fs "$(ROOT_DIR)/git/.gitconfig" "$(HOME)/"

karabiner:
	@ln -fs "$(ROOT_DIR)/karabiner" "$(HOME)/.config/karabiner"

.PHONY: all nvim tmux zsh fish git karabiner omf