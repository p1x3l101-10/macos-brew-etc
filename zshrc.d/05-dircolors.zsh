if [[ -f ~/.dir_colors ]] ; then
  eval "$(udircolors -b ~/.dir_colors)"
elif [[ -f /var/tmp/fakeroot/etc/DIR_COLORS ]] ; then
  eval "$(udircolors -b $(brew --prefix)etc/DIR_COLORS)"
else
  eval "$(udircolors -b)"
fi
