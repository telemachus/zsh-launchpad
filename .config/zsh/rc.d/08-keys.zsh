#!/bin/zsh

##
# Key bindings
#
# zsh-autocomplete and zsh-edit add many useful keybindings. See each of their
# respective docs for the full list:
# https://github.com/marlonrichert/zsh-autocomplete/blob/main/README.md#key-bindings
# https://github.com/marlonrichert/zsh-edit/blob/main/README.md#key-bindings
#

# Enable the use of Ctrl-Q and Ctrl-S for keyboard shortcuts.
unsetopt FLOW_CONTROL

# Use vim bindings, but keep C-a and C-e from emacs.
bindkey -v
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line

autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

# Fix backspace key after using ZLE
bindkey "^?" backward-delete-char


# Alt-Q
# - On the main prompt: Push aside your current command line, so you can type a
#   new one. The old command line is re-inserted when you press Alt-G or
#   automatically on the next command line.
# - On the continuation prompt: Move all entered lines to the main prompt, so
#   you can edit the previous lines.
bindkey '^[q' push-line-or-edit


# Ctrl-H: Get help on your current command.
HELPDIR="/usr/share/zsh/$(zsh --version | cut -d' ' -f2)/help"
(( ${+aliases[run-help]} )) && unalias run-help
autoload -RUz run-help
zmodload -F zsh/parameter p:functions_source
autoload -Uz $functions_source[run-help]-*~*.zwc
bindkey -M viins '^h' run-help

# Alt-V: Show the next key combo's terminal code and state what it does.
bindkey '^[v' describe-key-briefly

# Alt-W: Type a widget name and press Enter to see the keys bound to it.
# Type part of a widget name and press Enter for autocompletion.
bindkey '^[w' where-is

# Alt-Shift-S: Prefix the current or previous command line with `sudo`.
() {
  bindkey '^[S' $1  # Bind Alt-Shift-S to the widget below.
  zle -N $1         # Create a widget that calls the function below.
  $1() {            # Create the function.
    # If the command line is empty or just whitespace, then first load the
    # previous line.
    [[ $BUFFER == [[:space:]]# ]] &&
        zle .up-history

    # $LBUFFER is the part of the command line that's left of the cursor. This
    # way, we preserve the cursor's position.
    LBUFFER="sudo $LBUFFER"
  }
} .sudo

# vim: set ts=8 sw=4 ts=4 tw=0 et ft=zsh :
