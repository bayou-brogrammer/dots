#!/bin/sh

CHEZMOI_HOME="$HOME/.local/share/chezmoi/"
cd "$CHEZMOI_HOME" || exit

if [ -f .bundle_init ]; then
  exit
fi

brew bundle
touch .bundle_init
