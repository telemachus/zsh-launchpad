#!/bin/zsh

##
# Environment variables
#

# -U ensures each entry in these is unique (that is, discards duplicates).
export -U PATH path FPATH fpath MANPATH manpath
export -UT INFOPATH infopath  # -T creates a "tied" pair; see below.

# $PATH and $path (and also $FPATH and $fpath, etc.) are "tied" to each other.
# Modifying one will also modify the other.
# Note that each value in an array is expanded separately. Thus, we can use ~
# for $HOME in each $path entry.
path=(
    /home/linuxbrew/.linuxbrew/bin(N)   # (N): null if file doesn't exist
    ~/.local/bin
    $path
)

# Install Homebrew if it's not installed. See https://brew.sh for more info.
# Need to do this before using $HOMEBREW_PREFIX.
command -v brew > /dev/null ||
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# In order to be able to `autoload` a function for use on the command line, it
# either needs to be in your $fpath or you need to autoload by absolute path.
# (Note: Zsh's completions system will automatically autoload completion
# functions inside dirs that are in your $fpath. So, no need to explicitly
# autoload those.
fpath=(
    $ZDOTDIR/functions
    ~/.local/share/zsh/site-functions
    $fpath
    # Add Homebrew's dir to the end of $fpath, so that we use its completions
    # only for those commands that zsh doesn't already know how to complete.
    $HOMEBREW_PREFIX/share/zsh/site-functions
)
