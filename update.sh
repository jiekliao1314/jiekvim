rm -rf vim vimrc
cp -r ~/.vim .
cp ~/.vimrc .
mv .vim vim
mv .vimrc vimrc
rm -rf `find ./vim -name ".git*"`
