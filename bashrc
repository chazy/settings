export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

################################################################################
# Custom prompt coloring
################################################################################
SHORT_HOST=`hostname | sed 's/\..*//'`
if [[ "`uname`" == "Darwin" ]]; then
	PS1='\[\033[01;32m\]\w\[\033[00m\]\$ '
else
	PS1='\[\033[01;34m\]\w\[\033[00m\]\$ '
fi

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
export CROSS_COMPILE=arm-none-linux-gnueabi-
export PATH=$PATH:~/tools/arm-2010.09/bin
export MENUCONFIG_COLOR=blackbg

# MacPorts Installer addition on 2009-10-22_at_18:18:27: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

################################################################################
# KVM/ARM environment
################################################################################

function kvmarm_env()
{
	export PATH=$PATH:~/x-tools/arm-unknown-eabi/bin
	export CROSS_COMPILE=arm-unknown-eabi-
	export ARCH=arm
}
