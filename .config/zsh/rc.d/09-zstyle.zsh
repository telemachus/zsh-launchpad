zstyle ':completion:*:make:*:targets' call-command true
zstyle ':completion:*:*:make:*' tag-order 'targets'

zstyle ':completion:*:(ssh|scp|rsync):*' hosts $hosts
zstyle ':completion:*:(ssh|scp|rsync):*' users $users

zstyle ':completion:*:*:git-(push|fetch):*' file-patterns ''
zstyle ':completion:*:*:git-(push|fetch):*' tag-order \
    'remotes recent-branches branches'

# vim: set ts=8 sw=4 ts=4 tw=0 et ft=zsh :
