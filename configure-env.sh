#!/bin/bash

GITHUB_URL="git://github.com/chazy"

echo -e "Ensuring you have the required packages"
echo -e "======================================="
sudo apt-get -y --force-yes install \
	zsh tmux vim git curl cscope build-essential
sudo apt-get -y --force-yes build-dep qemu 
sudo apt-get -y --force-yes build-dep linux-image-$(uname -r)

echo -e "\nTaking care of your git config"
echo -e "=============================="
if [[ ! -f ~/.gitconfig ]]; then
	cd $HOME
	ln -s .settings/gitconfig .gitconfig
fi
if [[ ! -f ~/.gitignore ]]; then
	cd $HOME
	ln -s .settings/gitignore .gitignore
fi

echo -e "\nTaking care of your vim config"
echo -e "=============================="

if [[ ! -f ~/.vimrc ]]; then
	cd $HOME
	rm -f ~/.vimrc ~/.gvimrc ~/.vim
	git clone $GITHUB_URL/vim-config.git .vim
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
	git clone $GITHUB_URL/tmux-config.git .tmux
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
	git clone $GITHUB_URL/zsh-config.git .oh-my-zsh
	cd .oh-my-zsh
	cd $HOME
	ln -s .oh-my-zsh/zshrc .zshrc
	chsh -s `which zsh`
else
	echo -e "existing .zshrc, moving on...\n"
fi

echo "Done, happy hacking!"
