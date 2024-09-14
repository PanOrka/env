#! /bin/bash
set -Eeuo pipefail

CURRENT_DIR="$(dirname "$(realpath "$0")")"

sudo apt install git curl zsh fonts-powerline neovim

# Install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM}"/themes/powerlevel10k

cp "${CURRENT_DIR}"/zshrc ~/.zshrc
cp "${CURRENT_DIR}"/p10k.zsh ~/.p10k.zsh
cp "${CURRENT_DIR}"/aliases.zsh ~/.aliases.zsh

