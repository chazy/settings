export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

################################################################################
# Custom prompt coloring
################################################################################
SHORT_HOST=`hostname | sed 's/\..*//'`
if [[ "`uname`" == "Darwin" ]]; then
	PS1='\[\033[01;33m\]$SHORT_HOST\[\033[00m\]:\[\033[01;32m\]\w\[\033[00m\]\$ '
else
	PS1='\[\033[01;33m\]$SHORT_HOST\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
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
#export CROSS_COMPILE=arm-eabi-
export MENUCONFIG_COLOR=blackbg

# MacPorts Installer addition on 2009-10-22_at_18:18:27: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

################################################################################
# Subversion Settings
################################################################################

export SVN_EDITOR=vim
function svnAddAll {
	IFS=$'\n';
	for file in `svn status | grep '^\?.*' | sed -e 's/^\?[ \t]*//'`        
		do svn add "$file"
	done
}
