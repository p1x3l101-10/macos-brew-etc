#!/bin/bash

export HOMEBREW_PREFIX="/private/var/tmp/homebrew"
export HOMEBREW_REPOSITORY="${HOMEBREW_PREFIX}/Homebrew"
export HOMEBREW_GIT_REMOTE="https://github.com/Homebrew/brew"
export HOMEBREW_ETC_REPO="${HOMEBREW_ETC_REPO:-"NULL"}"

mkdir -p "${HOMEBREW_REPOSITORY}"

cd "$HOMEBREW_REPOSITORY"
git -c init.defaultBranch=master init --quiet
git config remote.origin.url "${HOMEBREW_BREW_GIT_REMOTE}"
git config remote.origin.fetch "+refs/heads/*:refs/remotes/origin/*"
git config --bool core.autocrlf false
git config --bool core.symlinks true
git fetch --force origin
git fetch --force --tags origin
git remote set-head origin --auto
LATEST_GIT_TAG="$(git tag --list --sort="-version:refname" | head -n1)"
git checkout --force -B stable $LATEST_GIT_TAG
cd "$HOMEBREW_PREFIX"
mkdir bin Applications
if [[ "$HOMEBREW_ETC_REPO" == "NULL" ]]; then
  mkdir -p etc/homebrew
  cat <<EOF > etc/homebrew/brew.env
\# Automatically generated settings
HOMEBREW_CASK_OPTS=--appdir=$HOMEBREW_PREFIX/Applications
HOMEBREW_BUNDLE_FILE_GLOBAL=$HOMEBREW_PREFIX/etc/homebrew/Brewfile
HOMEBREW_NO_ENV_HINTS=1
EOF
  cat <<EOF > etc/homebrew/Brewfile
tap "homebrew/bundle"
tap "homebrew/cask"
tap "p1x3l101-10/personal"
brew "p1x3l101-10/personal/brew-tools"
EOF
else
  git clone "$HOMEBREW_ETC_REPO" "$HOMEBREW_PREFIX/etc"
fi

eval "$("$HOMEBREW_PREFIX/bin/brew" shellenv)"
cat <<EOF >> "$HOME/.zshrc"

\# Source homebrew environment
eval \"\$(\"$HOMEBREW_PREFIX/bin/brew\" shellenv)\"
EOF
brew update --force
brew bundle install --global

