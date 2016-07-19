#jiekvim
**jiekvim** is a kind of vim configuration for **python** developer.

##Installation
###1.requirements
1. vim >= 7.3(**default**)
2. **ctags** for tagbar
3. **pep8** for flake8
4. **autopep8**

###2.install
1. git clone repository. 
```
git clone https://github.com/jiekliao1314/jiekvim.git
```

2. run install.sh

```
./install.sh
```

##Features
1. **nerdtree**
  I make the nerdtree auto-open and auto-quit, but auto-quit is related to vim version(For more details, please see the file **vimrc**).
2. **tagbar**
3. **minibufexplorer**
4. **powerline**
5.  **flake8**  
    I disabled some checkers and check scopes. 
    (For more details, please see `vim/ftplugin/python/flake8.vim` and `vim/ftplugin/python/pyflakes/checker.py`. You can search the key word **jiekliao** to locate the changes)
6. **autopep8**
7.  **vim-log-syntax**
A plugin for highlighting log key words!

##Troubleshooting
TODO

