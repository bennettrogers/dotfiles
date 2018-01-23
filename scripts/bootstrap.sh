#!/bin/bash -ex

# For OS X, install XCode and command line tools first.

# Start working in the home directory
pushd $HOME

# Configurable parameters
dotfiles_owner='bennettrogers'
joint_packages='git vim bash-completion npm'
osx_packages='python coreutils CMake the_silver_searcher reattach-to-user-namespace fzf'
linux_packages='python-pip'
pip_packages='virtualenvwrapper'
npm_packages='diff-so-fancy eslint prettier eslint-config-prettier eslint-plugin-prettier'


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
        # Install Homebrew if not installed
        if ! which brew; then
            ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
        fi
    fi

    # YUM SPECIFIC: We need EPEL (required for pip on ScientificLinux)
    if [[ $installtool == 'yum' || $installtool == 'sudo yum' ]]; then
        $installtool $installtoolflags install epel-release.noarch
    fi

    # Install packages with installtool
    $installtool $installtoolflags update
    $installtool $installtoolflags install $joint_packages
    if [[ $platform = 'osx' ]]; then
        $installtool install $installtoolflags $osx_packages
        # Careful, this will overwrite anything else in .bashrc_local
        echo 'export PATH="$PATH:/usr/local/share/python"' > $HOME/.bashrc_local
        PIP=/usr/local/bin/pip

        # Install fzf shell extensions
        /usr/local/opt/fzf/install
    else
        $installtool $installtoolflags install $linux_packages
        PIP=pip
    fi

    # Install pip packages
    sudo $PIP install $pip_packages

    # Install npm packages
    sudo npm install -g $npm_packages
fi

# # Install newest ruby and rbenv
# [ ! -e "$HOME/.rbenv" ] && git clone https://github.com/sstephenson/rbenv.git "$HOME/.rbenv"
# [ ! -e "$HOME/.rbenv/plugins/ruby-build" ] && git clone https://github.com/sstephenson/ruby-build.git "$HOME/.rbenv/plugins/ruby-build"
# PATH="$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH"
# for d in `find $HOME/.rbenv -name .git -type d`; do pushd $d/.. && git pull && popd; done
# LATESTRUBY=`rbenv install -l 2>&1|egrep '^\s*1\.9\..+-p[0-9]+'|sort|tail -1`
# rbenv versions|egrep -q $LATESTRUBY || rbenv install $LATESTRUBY
# rbenv global $LATESTRUBY
# rbenv rehash

# Trust github
mkdir -p .ssh
cat <<EOF >> .ssh/known_hosts
|1|6WX8FDwncDK8tfyfkLLbvyepVRw=|15RHFpHg3GHML7eJqvNL/yVYChI= ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAq2A7hRGmdnm9tUDbO9IDSwBK6TbQa+PXYPCPy6rbTrTtw7PHkccKrpp0yVhp5HdEIcKr6pLlVDBfOLX9QUsyCOV0wzfjIJNlGEYsdlLJizHhbn2mUjvSAHQqZETYP81eFzLQNnPHt4EVVUh7VfDESU84KezmD5QlWpXLmvU31/yMf+Se8xhHTvKSCZIFImWwoG6mbUoWf9nzpIoaSjB+weqqUUmpaaasXVal72J+UX2B+2RPW3RcT0eOzQgqlJL3RKrTJvdsjE3JEAvGq3lGHSZXy28G3skua2SmVi/w4yCE6gbODqnTWlg7+wC604ydGXA8VJiS5ap43JXiUFFAaQ==
|1|cccEMXs7ur0u/JXs4NQYv4A9Xb8=|Pddv+wa776NKeZ4v1yMn1cZWt4s= ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAq2A7hRGmdnm9tUDbO9IDSwBK6TbQa+PXYPCPy6rbTrTtw7PHkccKrpp0yVhp5HdEIcKr6pLlVDBfOLX9QUsyCOV0wzfjIJNlGEYsdlLJizHhbn2mUjvSAHQqZETYP81eFzLQNnPHt4EVVUh7VfDESU84KezmD5QlWpXLmvU31/yMf+Se8xhHTvKSCZIFImWwoG6mbUoWf9nzpIoaSjB+weqqUUmpaaasXVal72J+UX2B+2RPW3RcT0eOzQgqlJL3RKrTJvdsjE3JEAvGq3lGHSZXy28G3skua2SmVi/w4yCE6gbODqnTWlg7+wC604ydGXA8VJiS5ap43JXiUFFAaQ==
EOF

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
