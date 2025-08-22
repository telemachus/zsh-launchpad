local znap=$HOME/Documents/zsh-repos/zsh-snap/znap.zsh

# Auto-install Znap if necessary.
if ! [[ -r $znap ]]; then
    mkdir -p $znap:h:h
    git -C $znap:h:h clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git
fi

. $znap

# vim: set ts=8 sw=4 ts=4 tw=0 et ft=zsh :
