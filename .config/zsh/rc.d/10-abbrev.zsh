# A *ridiculously* minimal abbreviations plugin for zsh.
_expand_abbrev() {
    # Get the current word
    local current_word="${LBUFFER##* }"

    if [[ "$current_word" == "G" ]]; then
        # Replace G with ~[git]/
        LBUFFER="${LBUFFER%G}~[git]/"
    else
        # Insert normal space
        LBUFFER="$LBUFFER "
    fi
}

zle -N _expand_abbrev
bindkey ' ' _expand_abbrev

# vim: set ts=8 sw=4 ts=4 tw=0 et ft=zsh :
