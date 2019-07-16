#!/bin/sh
INSTALL_TO=~/Projects

warn() {
    echo "$1" >&2
}

die() {
    warn "$1"
    exit 1
}

install_myconfig () {
    [ -e "$INSTALL_TO/myconfig" ] && die "$INSTALL_TO/myconfig already exists."
    [ -e "~/.vim" ] && die "~/.vim already exists."
    [ -e "~/.vimrc" ] && die "~/.vimrc already exists."

    cd "$INSTALL_TO"
    git clone https://github.com/Flo-mrt/myconfig.git
    cd myconfig

    # Symlink ~/.vim and ~/.vimrc
    cd ~
    ln -s "$INSTALL_TO/myconfig/vimrc" .vimrc
    ln -s "$INSTALL_TO/myconfig/vim" .vim
    ln -s "$INSTALL_TO/myconfig/tmux.conf" .tmux.conf
    ln -s "$INSTALL_TO/myconfig/tmux.conf.local" .tmux.conf.local

    echo "Installed and configured .vim and .tmux, have fun."
}

install_myconfig
