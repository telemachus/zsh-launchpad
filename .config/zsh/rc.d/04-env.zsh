# -U ensures each entry in these is unique (that is, discards duplicates).
export -U PATH path FPATH fpath MANPATH manpath
export -UT INFOPATH infopath

path=(
    # (N): null if file doesn't exist
    $HOME/local/go/bin(N)
    $HOME/local/lua/bin(N)
    $HOME/local/lua-language-server/bin(N)
    $HOME/local/neovim/bin(N)
    $HOME/local/passage/bin(N)
    $HOME/local/vim/bin(N)
    $HOME/.local/bin(N)
    $HOME/.cargo/bin
    $HOME/bin(N)
    $path
)

# In order to be able to `autoload` a function for use on the command line, it
# either needs to be in the $fpath or you need to autoload by absolute path.
# Note: Zsh's completions system will automatically autoload completion
# functions inside dirs that are in the $fpath. So, no need to explicitly
# autoload those.
fpath=(
    $ZDOTDIR/functions
    $HOME/local/share/zsh/site-functions(N)
    $fpath
    # Add MacPort's dir to the end of $fpath, so that we use its completions
    # only for those commands that zsh doesn't already know how to complete.
    /opt/local/share/zsh/site-functions
)

export MAILDIR=$HOME/.maildir
export NO_COLOR=1
export VISUAL=nvim
export EDITOR="$VISUAL"
export VIMCONFIG=$HOME/.vim
export VIMDATA=$HOME/.vim

# Configure less:
# -G: no search highlighting
# -R: handle ANSI escape codes
# -J: show search locations in side column
# -x4: 4-space tabs
# P...: prompt containing [filename/STDIN] and [N%] for percentage through file.
export LESS='-GRJx4P?f[%f]:[STDIN].?pB - [%pB\%]:\.\.\..'
export PAGER=less

# Configure par:
# r: repeat quote prefixes
# T: handle tabs
# b: handle backspaces
# g: guess paragraphs
# q: handle nested quotes
# R: repeat non-whitespace prefixes
# B=.,?_A_a: body chars (punctuation + letters)
# Q=_s>|: quote chars (underscore, space, >, |)
export PARINIT='rTbgqR B=.,?_A_a Q=_s>|'

zsh_directory_name() {
    emulate -L zsh

    if [[ $1 = n && $2 = git ]]; then
        local git_root=$(git rev-parse --show-toplevel 2>/dev/null)
        if [[ -n $git_root ]]; then
            typeset -ga reply=("$git_root")
            return 0
        fi
    fi

    return 1
}

# vim: set ts=8 sw=4 ts=4 tw=0 et ft=zsh :
