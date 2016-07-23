#!/bin/bash 

echo "Start setting up vim..." 

install_vimrc="$HOME/.vimrc"
install_vim="$HOME/.vim"

if [ -f $install_vimrc ];then
    mv $install_vimrc "${install_vimrc}.bak" >/dev/null
fi

if [ -d $install_vim ];then
    mv $install_vim  "${install_vim}.bak" >/dev/null
fi

cp vimrc $install_vimrc && cp -r vim $install_vim

if [ $? -eq 0 ];then
    echo "Vim is set up successfully!"
    echo "--------------------------"
    echo "Make sure the following packages installed:"
    echo "*ctags"
    echo "--------------------------"
else
    echo "Failed in setting up vim!"
fi
