#!/bin/sh
INSTALL_TO=~

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

    # Download vim plugin bundles
    git submodule init
    git submodule update

    # Symlink ~/.vim and ~/.vimrc
    cd ~
    #ln -s "$INSTALL_TO/myconfig/vimrc" .vimrc
    #ln -s "$INSTALL_TO/myconfig/vim" .vim
    #ln -s "$INSTALL_TO/myconfig/tmux.conf" .tmux.conf
    #ln -s "$INSTALL_TO/myconfig/tmux.conf.local" .tmux.conf.local

    echo "Installed and configured .vim, have fun."
}

install_myconfig
