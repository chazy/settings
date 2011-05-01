export PATH=$PATH:/opt/local/bin

################################################################################
# Custom prompt coloring
################################################################################
PS1='\[\033[01;32m\]\w\[\033[00m\]\$ '

################################################################################
# Custom PATH configuration
################################################################################
export PATH=$PATH:~/bin:~/scripts:~/src/android-cont/android/prebuilt/darwin-x86/toolchain/arm-eabi-4.4.0/bin/

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
export CROSS_COMPILE=arm-eabi-
export MENUCONFIG_COLOR=blackbg

################################################################################
# Android compilation settings
################################################################################
export ANDROID_ROOT=~/src/android-cont/android
export ANDROID_HOST=darwin-x86
export ANDROID_IMGS=~/images/android-cont
export ANDROID_DFLT_IMGDIR=goldfish/eng/gingerbread-containers
export ANDROID_DFLT_PRODUCT=goldfish
export ANDROID_KERNEL_DIR=~/src/android-cont/kernel/cm
export ANDROID_PRODUCT_OUT=~/src/android-cont/android/out/target/product/goldfish
export USER_AC_ROOT=~/src/android-cont/user-ac
. ~/.android-env.sh
function mountAndroid { hdiutil attach ~/src/android-cont.dmg -mountpoint ~/src/android-cont; }

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
