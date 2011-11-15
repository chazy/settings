export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

export PATH=$PATH:/opt/local/bin

################################################################################
# Custom prompt coloring
################################################################################
PS1='\[\033[01;32m\]\w\[\033[00m\]\$ '

################################################################################
# Custom PATH configuration
################################################################################
export PATH=$PATH:~/bin

################################################################################
# Git settings
################################################################################
export GIT_EDITOR=/usr/bin/vim
export GIT_AUTHOR_NAME="Christoffer Dall"
export GIT_AUTHOR_EMAIL="cdall@cs.columbia.edu"
export GIT_COMMITTER_NAME="Christoffer Dall"
export GIT_COMMITTER_EMAIL="cdall@cs.columbia.edu"

################################################################################
# Linux compilation settings 
################################################################################
export ARCH=arm
#export CROSS_COMPILE=arm-eabi-
export MENUCONFIG_COLOR=blackbg

################################################################################
# Back ports settings
################################################################################
export PATH=/opt/local/bin:/opt/local/sbin:$PATH

################################################################################
# Poser specific settings
################################################################################
mountPoser() { hdiutil attach -quiet -mountpoint ~/src/poser ~/src/poser.sparsebundle; }

export PATH=$PATH:~/bin
export COLUMBIA_POSER_ROOT=/Users/christoffer/src/poser
function poser-droid() {
	export ANDROID_ROOT=$COLUMBIA_POSER_ROOT
	export ANDROID_IMGS=$COLUMBIA_POSER_ROOT/imgs
	export ANDROID_KERNEL_DIR=$COLUMBIA_POSER_ROOT/kernel
	pushd $ANDROID_ROOT
	source ./source-me.sh $@
	popd
}
