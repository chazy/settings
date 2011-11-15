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

