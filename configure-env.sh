#!/bin/bash

echo -e "Ensuring you have the required packages"
echo -e "======================================="
sudo apt-get install zsh tmux vim git curl cscope build-essential gcc-4.6-arm-linux-gnueabi minicom libncurses-dev

echo -e "\nTaking care of your vim config"
echo -e "=============================="

if [[ ! -f ~/.vimrc ]]; then
	cd $HOME
	rm -f ~/.vimrc ~/.gvimrc ~/.vim
	git clone git@github.com:chazy/vim-config.git .vim
	cd .vim
	git submodule init
	git submodule update
	mkdir swap
	cd $HOME
	ln -s .vim/vimrc .vimrc
	ln -s .vim/gvimrc .gvimrc
else
	echo -e "existing .vimrc, moving on...\n"
fi

echo -e "\nTaking care of your tmux config"
echo -e "==============================="
if [[ ! -f ~/.tmux-config ]]; then
	cd $HOME
	rm -rf ~/.tmux
	git clone git@github.com:chazy/tmux-config.git .tmux
	cd .tmux
	make install
	cd $HOME
else
	echo -e "existing .tmux-config, moving on...\n"
fi

echo -e "\nTaking care of your tmux config"
echo -e "===============================\n"
if [[ ! -f ~/.zshrc ]]; then
	cd $HOME
	rm -rf ~/.oh-my-zsh
	git clone git@github.com:chazy/zsh-config.git .oh-my-zsh
	cd .oh-my-zsh
	cd $HOME
	ln -s .oh-my-zsh/zshrc .zshrc
	chsh -s `which zsh`
else
	echo -e "existing .zshrc, moving on...\n"
fi


echo "Done, happy coding!"
