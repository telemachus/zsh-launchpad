# Always set aliases _last,_ so they don't get used in function definitions.

# Movement
alias -- -='cd -'
alias ..='cd ..'
alias ...='cd ../..'

# These aliases enable you to paste example code into the terminal without the
# shell complaining about the pasted prompt symbol.
alias %= \$=

# zmv lets you batch rename (or copy or link) files by using pattern matching.
# https://zsh.sourceforge.io/Doc/Release/User-Contributions.html#index-zmv
autoload -Uz zmv
alias zmv='zmv -Mv'
alias zcp='zmv -Cv'
alias zln='zmv -Lv'

# Associate file name .extensions with programs to open them.
# This lets you open a file just by typing its name and pressing enter.
# Note that the dot is implicit; `gz` below stands for files ending in .gz
alias -s {css,diff,go,html,json,lua,md,patch,txt,xml,yml,zsh}=$EDITOR
alias -s gz='gzip -l'
alias -s {log,out}='tail -F'

# Disable color on ls and also add handy aliases
alias l='ls --color=none'
alias ll='l -l'
alias la='l -A'
alias lf='l -CF'
alias l.='l -d .[^.]* 2>/dev/null'
alias l.f='l -F -d .[^.]* 2>/dev/null'
alias l.l='l -ld .[^.]* 2>/dev/null'

# Aliases for safety
alias rmi='rm -i'
alias rmp='rm -P'
alias cpi='cp -i'
alias mvi='mv -i'

# Aliases for clarity
alias cpv='cp -v'
alias rmv='rm -v'
alias mvv='mv -v'

# Make my life easier
alias cpr='cp -r'

# A few git aliases
alias gs='git status -sb'
alias g.='gs .'
alias gd='git diff'
alias gdh='git diff HEAD'
alias gl='git pull'
alias gp='git push'

# View current playlist with numbers
alias nlist='mpc playlist | cat -n -'

# Lock my screen quickly
alias lock="osascript -e 'tell application \"System Events\" to keystroke \"q\" using {command down,control down}'"

# reindex spotlight
alias respotlight='sudo mdutil -E /'

# convenient invocation of head
alias one='head -n1'

# Make life simpler
alias words='wc -w'

# neomutt > mutt
alias mutt=neomutt

# find executables: see this comment on Stack Overflow.
# https://bit.ly/3BRvXjT
# For an alternative, see this answer on Stack Overflow.
# https://stackoverflow.com/a/4458361/26702
alias findexecs='find . -type f -perm -a=x'

# daily updates
alias morning='sudo portup ; neoup'


# alias for profiling zsh startup
alias profilez='time ZSH_DEBUGRC=1 zsh -i -c exit'

# alias to manually reload zcompdump
alias rebuildcomp='rm -f ~/.zcompdump* && autoload -Uz compinit && compinit'

# Use `< file` to quickly view the contents of any text file.
READNULLCMD=$PAGER  # Set the program to use for this.

# vim: set ts=8 sw=4 ts=4 tw=0 et ft=zsh :
