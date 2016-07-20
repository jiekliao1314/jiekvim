#!/bin/bash 

echo "Start setting up vim..." 

rm -rf ~/.vim.bak ~/.vimrc.bak >/dev/null

mv ~/.vim ~/.vim.bak >/dev/null
mv ~/.vimrc ~/.vimrc.bak >/dev/null

cp vimrc ~/.vimrc && cp -r vim ~/.vim 

if [ $? -eq 0 ];then
    echo "Vim is set up successfully!"
    echo "--------------------------"
    echo "Make sure the following packages installed:"
    echo "*ctags"
    echo "--------------------------"
else
    echo "Failed in setting up vim!"
fi
