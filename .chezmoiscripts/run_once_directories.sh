#!/bin/bash

echo "Preparing directories..."

REQUIRED_DIRS=(
  "$XDG_DATA_HOME/pass/"
  "$XDG_DATA_HOME/gnupg/"
  "$XDG_CACHE_HOME/terraform/plugins-cache/"
)

for DIR in "${REQUIRED_DIRS[@]}"; do
  if [ ! -d "${DIR}" ]; then
    mkdir -p "${DIR}"
  fi
done
