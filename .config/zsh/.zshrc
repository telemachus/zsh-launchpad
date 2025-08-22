() {
  local file=
  for file in $ZDOTDIR/rc.d/<->-*.zsh(n); do
    # `.` is like `source` but doesn't search $path.
    . $file
  done
} "$@"

# vim: set ts=8 sw=4 ts=4 tw=0 et ft=zsh :
