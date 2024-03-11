#!/bin/bash -ex

# For OS X, install XCode, command line tools, and homebrew first.

# Start working in the home directory
pushd $HOME

# Configurable parameters
dotfiles_owner='bennettrogers'
joint_packages='git git-delta vim'
osx_packages=''
linux_packages=''
pip_packages=''


# get args
while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    -i|--install)
    INSTALL=YES
    ;;
    *)
            # unknown option
    ;;
esac
shift # past argument or value
done

# Don't touch these
unamestr=`uname -s`
platform=''
installtool=''
installtoolflags=''


# Set the correct platform
if [[ "$unamestr" == 'Linux' ]]; then
    platform='linux'
elif [[ "$unamestr" == 'Darwin' ]]; then
    platform='osx'
fi

if [[ ${INSTALL} == 'YES' ]]; then
    # Set the correct installtool
    if [[ $platform == 'linux' ]]; then
        if [[ -x "$(which apt-get)" ]]; then
            installtool='apt-get'
        elif [[ -x "$(which yum)" ]]; then
            installtool='yum'
        fi

        if [[ `whoami` != 'root' ]]; then
            installtool='sudo '$installtool
        fi
        installtoolflags='-y'
    elif [[ $platform == 'osx' ]]; then
        installtool='brew'
    fi

    # Install packages with installtool
    $installtool $installtoolflags update
    $installtool $installtoolflags install $joint_packages
    if [[ $platform = 'osx' ]]; then
        $installtool install $installtoolflags $osx_packages

        # Install fzf shell extensions
        /usr/local/opt/fzf/install
    else
        $installtool $installtoolflags install $linux_packages
        PIP=pip
    fi

    # Install pip packages
    sudo $PIP install $pip_packages
fi

# Install homeshick
HOMESHICK_DIR=$HOME/.homesick/repos/homeshick
HOMESHICK_BIN=$HOMESHICK_DIR/bin/homeshick
[ ! -e $HOMESHICK_DIR ] && git clone https://github.com/andsens/homeshick.git $HOMESHICK_DIR
$HOMESHICK_BIN link

# Deploy dotfiles
repos="dotfiles"
for r in $repos; do [ -e $HOME/.homesick/repos/$r ] || $HOMESHICK_BIN --batch --force clone $dotfiles_owner/$r; done

if [ ! -d .dotfile-backup ]; then
    mkdir -p .dotfile-backup
    mv .bashrc .dotfile-backup/ || true
    mv .profile .dotfile-backup/ || true
fi

for r in $repos; do $HOMESHICK_BIN --batch --force symlink $r; done

# sync vim plugins
$HOME/.homesick/repos/dotfiles/vim/sync.sh

# Go back whence you came
popd

echo "Run 'exec \$SHELL' to restart the shell"
