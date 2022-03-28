#!/bin/sh

warn() {
    echo "$1" >&2
}

die() {
    warn "$1"
    exit 1
}

install_myconfig () {
    [ -e "~/.config/myconfig" ] && die "~/.config/myconfig already exists."
    [ -e "~/.config/nvim" ] && die "~/.config/nvim already exists."

    cd "~/.config"
    git clone https://github.com/Flo-mrt/myconfig.git

    # Symlink ~/.vim and ~/.vimrc
    cd ~
    ln -s "~/.config/myconfig/nvim" ~/.config/nvim
    ln -s "~/.config/myconfig/polybar" ~/.config/polybar

    sudo apt-install fd-find ripgrep neovim

    echo "Installed and configured, have fun."
}

install_myconfig
