#!/bin/bash 

echo "Start installing .vim and .vimrc!"
rm -rf ~/.vim.bak
mv ~/.vim ~/.vim.bak && mv ~/.vimrc ~/.vimrc.bak
cp -r vim ~/.vim && cp vimrc ~/.vimrc
echo "Vim is set up successfully!"
