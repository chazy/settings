#!/bin/bash

echo -n "Use writeable git remotes (requires appropriate public SSH key) (y/N): "
read WRITABLE

if [[ "$WRITABLE" == "y" || "$WRITABLE" == "Y" ]]; then
	GITHUB_URL="git@github.com:chazy"
else
	GITHUB_URL="git://github.com/chazy"
fi

echo -e "Ensuring you have the required packages"
echo -e "======================================="
sudo apt-get install zsh tmux vim git curl cscope build-essential gcc-4.6-arm-linux-gnueabi minicom libncurses-dev

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

echo -e "\nTaking care of your mutt config"
echo -e "===============================\n"
if [[ ! -f ~/.muttrc ]]; then
	cd $HOME
	ln -s .settings/muttrc .muttrc
	mkdir -p .mutt/cache/bodies
	mkdir -p .mutt/cache/headers
else
	echo -e "existing .muttrc, moving on...\n"
fi

echo "Done, happy coding!"
