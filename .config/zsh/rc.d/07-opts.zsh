#!/bin/zsh

# Set these after sourcing plugins, because those might set options, too.

# Don't let > silently overwrite files. To overwrite, use >! instead.
setopt NO_CLOBBER

# Treat comments pasted into the command line as comments, not code.
setopt INTERACTIVE_COMMENTS

# Don't treat non-executable files in your $path as commands. This makes sure
# they don't show up as command completions. Settinig this option can impact
# performance on older systems, but should not be a problem on modern ones.
setopt HASH_EXECUTABLES_ONLY

# Enable ** and *** as shortcuts for **/* and ***/*, respectively.
# https://zsh.sourceforge.io/Doc/Release/Expansion.html#Recursive-Globbing
setopt GLOB_STAR_SHORT

# Sort numbers numerically, not lexicographically.
setopt NUMERIC_GLOB_SORT

setopt AUTO_CD
setopt CD_SILENT
setopt AUTO_LIST
setopt NO_AUTO_MENU
setopt NO_MENU_COMPLETE
setopt CASE_GLOB
setopt CASE_MATCH

# vim: set ts=8 sw=4 ts=4 tw=0 et ft=zsh :
