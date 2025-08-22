# Add the plugins you want to use here.
# For more info on each plugin, visit its repo at github.com/<plugin>
# -a sets the variable's type to array.
# local -a plugins=(
    # marlonrichert/zsh-autocomplete      # Real-time type-ahead completion
    # marlonrichert/zsh-edit              # Better keyboard shortcuts
    # marlonrichert/zsh-hist              # Edit history from the command line.
    # marlonrichert/zcolors               # Colors for completions and Git
    # zsh-users/zsh-autosuggestions       # Inline suggestions
    # zsh-users/zsh-syntax-highlighting   # Command-line syntax highlighting
# )

# The Zsh Autocomplete plugin sends *a lot* of characters to your terminal.
# This is fine locally on modern machines, but if you're working through a slow
# ssh connection, you might want to add a slight delay before the
# autocompletion kicks in:
#   zstyle ':autocomplete:*' min-delay 0.5  # seconds
#
# If your connection is VERY slow, then you might want to disable
# autocompletion completely and use only tab completion instead:
#   zstyle ':autocomplete:*' async no


# Speed up the first startup by cloning all plugins in parallel.
# This won't clone plugins that we already have.
# znap clone $plugins

# Load each plugin, one at a time.
# local p=
# for p in $plugins; do
#   znap source $p
# done

# vim: set ts=8 sw=4 ts=4 tw=0 et ft=zsh :
