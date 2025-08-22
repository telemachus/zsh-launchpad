#!/usr/bin/make -f
SHELL = /bin/zsh
.SHELLFLAGS = -f

.ONESHELL:
.PHONY: all

ENV ?= $(HOME)/.zshenv
ZDOTDIR ?= $(HOME)/.config/zsh

# TODO: Have this use ln -s rather than mv and cp.
all:
	chmod -R go-rw .config/zsh/{.zshrc,rc.d}
	-mv $(ENV) $(ENV)~ 2>/dev/null
	-mv $(ZDOTDIR) $(ZDOTDIR)~ 2>/dev/null
	mkdir -p $(ZDOTDIR)
	cp .zshenv $(ENV)
	cp -R .config/zsh/* .config/zsh/.zshrc $(ZDOTDIR)
