#!/bin/bash 
echo "Start install pep8 and autopep8!"
easy_install -U pep8 autopep8 >/dev/null

if [ $? -eq 0 ];then
    echo "Start install .vim and .vimrc!"
    rm -rf ~/.vim  ~/.vimrc
    cp -r vim ~/.vim
    cp vimrc ~/.vimrc
    echo "Vim is set successfully!"
else
    echo "Error in installing pep8 and autopep8!"
fi
