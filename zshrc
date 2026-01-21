#for rc in /var/tmp/.homebrew/etc/zshrc.d/*; do
	#. $rc
#done

eval "$(/private/var/tmp/.homebrew/bin/brew shellenv)"
# Ensure the XDG directories are set and made
export XDG_CONFIG_HOME="$HOMEBREW_PREFIX/etc/xdg"
export XDG_DATA_HOME="$HOMEBREW_PREFIX/local/share"
export XDG_STATE_HOME="$HOMEBREW_PREFIX/var/lib"
export XDG_CACHE_HOME="$HOME/Library/Caches"
export XDG_BIN_HOME="$HOMEBREW_PREFIX/local/bin"
export XDG_RUNTIME_DIR="$(getconf DARWIN_USER_TEMP_DIR)"

# Launch nushell if this is a login shell, I am switching to nu anyways
if [[ -o login ]] && [[ -o interactive ]]; then
  which nu 2>&1 > /dev/null && exec nu --login
fi

echo "WARNING, nushell was not found"
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
