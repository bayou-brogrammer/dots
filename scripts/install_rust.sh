#!/bin/sh

# exit immediately if password-manager-binary is already in $PATH
type cargo >/dev/null 2>&1 && exit

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
