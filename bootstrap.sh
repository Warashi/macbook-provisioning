#!/usr/bin/env zsh
set -euo pipefail

xcode-select --install || true

THIS_REPO_PATH=$HOME/ghq/github.com/Warashi/macbook-provisioning
if [[ ! -d "$(dirname "$THIS_REPO_PATH")" ]]; then
	mkdir -p "$(dirname "$THIS_REPO_PATH")"
fi
if [[ ! -d "$THIS_REPO_PATH" ]]; then
  git clone https://github.com/Warashi/macbook-provisioning.git "$THIS_REPO_PATH"
else
  echo "$THIS_REPO_PATH already downloaded. Updating..."
  pushd "$THIS_REPO_PATH"
  git stash
  git checkout master
  git pull origin master
  popd
  echo
fi

DOTPATH=$HOME/ghq/github.com/Warashi/dotfiles
if [ ! -d "$DOTPATH" ]; then
  git clone https://github.com/Warashi/dotfiles.git "$DOTPATH"
else
  echo "$DOTPATH already downloaded. Updating..."
  pushd "$DOTPATH"
  git stash
  git checkout master
  git pull origin master
  popd
  echo
fi

find "$DOTPATH" -type f -and -not -path "$DOTPATH/.git/*" | while read -r f; do
	mkdir -p "$(dirname "$HOME/${f#"$DOTPATH/"}")"
	ln -fvns "$f" "$HOME/${f#"$DOTPATH/"}"
done

# install homebrew
if ! command -v brew >/dev/null 2>&1; then
  # Install homebrew: https://brew.sh/
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  echo
fi

brew bundle --file="$THIS_REPO_PATH/Brewfile"
echo

mackup restore
echo
