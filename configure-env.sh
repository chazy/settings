#!/bin/bash

sudo apt-get update
sudo apt-get install zsh tmux vim git curl cscope build-essential gcc-4.6-arm-linux-gnueabi

cd $HOME
git clone git@github.com:chazy/vim-config.git .vim
cd .vim
git submodule init
git submodule update
cd $HOME
ln -s .vim/vimrc .vimrc
ln -s .vim/gvimrc .gvimrc

git clone git@github.com:chazy/tmux-config.git .tmux
cd .tmux
make install
cd $HOME

git clone git@github.com:chazy/zsh-config-config.git .oh-my-zsh
cd .oh-my-zsh
make install
cd $HOME
#ln -s .oh-my-zsh/zshrc .zshrc

chsh -s `which zsh`
