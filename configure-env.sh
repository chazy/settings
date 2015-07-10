#!/bin/bash

WRITABLE=false
MAILCONFIG=false

usage() {
	U=""
	if [[ -n "$1" ]]; then
		U="${U}$1\n\n"
	fi
	U="${U}Usage: $0 [options] \n\n"
	U="${U}Options:\n"
	U="$U    -w:       Use writeabe git remote paths (requires approved SSH key)\n"
	U="$U    -m:       Setup mutt mail client\n"
	echo -e "$U" >&2
}

while :
do
	case "$1" in
	  -w)
		WRITABLE=true
		shift 1
		;;
	  -m)
		MAILCONFIG=true
		shift 1
		;;
	  -h | --help)
		usage ""
		exit 1
		;;
	  -*) # Unknown option
		usage "Error: Unknown option: $1"
		exit 1
		;;
	  *)
		break
		;;
	esac
done

if [[ $WRITABLE == true ]]; then
	GITHUB_URL="git@github.com:chazy"
else
	GITHUB_URL="git://github.com/chazy"
fi

echo -e "Ensuring you have the required packages"
echo -e "======================================="
sudo apt-get -y install zsh tmux vim git curl cscope \
	minicom python-pip htop mosh

sudo apt-get -y install build-essential libncurses5-dev 
sudo apt-get -y build-dep linux-generic
sudo apt-get -y build-dep qemu

grep -q 'Intel' /proc/cpuinfo
if [[ $? == 0 ]]; then
	sudo apt-get -y install gcc-arm-linux-gnueabihf
fi

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

echo -e "\nTaking care of your zsh config"
echo -e "===============================\n"
if [[ ! -f ~/.zshrc ]]; then
	cd $HOME
	rm -rf ~/.oh-my-zsh
	git clone $GITHUB_URL/zsh-config.git .oh-my-zsh
	cd .oh-my-zsh
	cd $HOME
	ln -s .oh-my-zsh/zshrc .zshrc
	sudo chsh -s `which zsh` `whoami`
else
	echo -e "existing .zshrc, moving on...\n"
fi

if [[ $MAILCONFIG == true ]]; then
	sudo apt-get -y install mutt offlineimap msmtp

	echo -e "\nTaking care of your mutt config"
	echo -e "===============================\n"
	if [[ ! -f ~/.muttrc ]]; then
		cd $HOME
		cd .settings
		git submodule init
		git submodule update
		cd ..
		cp .settings/muttrc .muttrc
		mkdir -p .mutt/cache/bodies
		mkdir -p .mutt/cache/headers
		mkdir -p .mail/private
		ln -s .settings/mutt-colors-solarized/mutt-colors-solarized-dark-256.muttrc .mutt-colors.muttrc
		mkdir -p ~/bin
		cp .settings/mailrun.sh ~/bin/.
		chmod a+x ~/bin/mailrun.sh
		cp .settings/msmtprc ~/.msmtprc
		cp .settings/offlineimaprc ~/.offlineimaprc
		sudo pip install goobook
		ln -s .settings/goobookrc ~/.goobookrc
		cp .settings/netrc ~/.netrc
		echo -e "\n\n           --- NOTE ---         "
		echo "Replace 'secret' with your actual password in:"
		echo -e "    ~/.offlineimaprc"
		echo -e "    ~/.msmtprc\n\n"
		echo -e "    ~/.netrc\n\n"
	else
		echo -e "existing .muttrc, moving on...\n"
	fi
fi

echo "Done, happy coding!"
