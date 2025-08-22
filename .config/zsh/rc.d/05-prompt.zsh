znap clone telemachus/git-prompt.zsh

ZSH_GIT_PROMPT_SHOW_STASH=1
ZSH_GIT_PROMPT_SHOW_UPSTREAM_NAME=1

PROMPT='%3~ $(gitprompt)%# '
znap source telemachus/git-prompt.zsh
znap prompt

# vim: set ts=8 sw=4 ts=4 tw=0 et ft=zsh :
