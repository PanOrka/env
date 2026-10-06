#! /bin/bash
set -Eeuo pipefail

CURRENT_DIR="$(dirname "$(realpath "$0")")"

sudo apt install git curl zsh fonts-powerline ripgrep fzf npm xclip tmux

# Install latest neovim
(
    cd "$(mktemp -d)"
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
    sudo rm -rf /opt/nvim
    sudo mkdir -p /opt/nvim
    sudo tar --strip-components=1 -C /opt/nvim -xzf nvim-linux-x86_64.tar.gz
)

# Install zsh
rm -rf ~/.oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh) --unattended"

# Download powerlevel10k theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k

cp "${CURRENT_DIR}"/zshrc ~/.zshrc
cp "${CURRENT_DIR}"/p10k.zsh ~/.p10k.zsh
cp "${CURRENT_DIR}"/aliases.zsh ~/.aliases.zsh
cp "${CURRENT_DIR}"/tmux.conf ~/.tmux.conf
cp -r "${CURRENT_DIR}"/nvim ~/.config/

# Download Packer plugin manager for neovim
rm -rf ~/.local/share/nvim/site/pack/packer/start/packer.nvim
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

