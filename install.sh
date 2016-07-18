#!/bin/bash 

echo "Start installing .vim and .vimrc!"

rm -rf ~/.vim.bak ~/.vimrc.bak >/dev/null

mv ~/.vim ~/.vim.bak >/dev/null
mv ~/.vimrc ~/.vimrc.bak >/dev/null

cp -r vim ~/.vim && cp vimrc ~/.vimrc
if [ $? -eq 0 ];then
    echo "Vim is set up successfully!"
else
    echo "Error!"


