# https://zsh.sourceforge.io/Doc/Release/Expansion.html#Filename-Generation
setopt EXTENDED_GLOB

HISTFILE=${XDG_DATA_HOME:=~/.local/share}/zsh/history

[[ -d $HISTFILE:h ]] ||
    mkdir -p $HISTFILE:h

SAVEHIST=$(( 100 * 1000 ))
HISTSIZE=$(( 1.2 * SAVEHIST ))

setopt HIST_FCNTL_LOCK
setopt HIST_IGNORE_ALL_DUPS
setopt SHARE_HISTORY
setopt HIST_IGNORE_SPACE
setopt HIST_NO_STORE
setopt HIST_VERIFY

# vim: set ts=8 sw=4 ts=4 tw=0 et ft=zsh :
