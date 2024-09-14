#! /bin/bash
set -Eeuo pipefail

CURRENT_DIR="$(dirname "$(realpath "$0")")"

sudo apt install git curl zsh fonts-powerline

# Install latest neovim
(
    cd "$(mktemp -d)"
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
    sudo rm -rf /opt/nvim
    sudo tar -C /opt -xzf nvim-linux64.tar.gz
)

# Install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh) --unattended"

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k

cp "${CURRENT_DIR}"/zshrc ~/.zshrc
cp "${CURRENT_DIR}"/p10k.zsh ~/.p10k.zsh
cp "${CURRENT_DIR}"/aliases.zsh ~/.aliases.zsh
cp -r "${CURRENT_DIR}"/nvim ~/.config/

git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

