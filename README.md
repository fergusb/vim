# Fergus' vim setup

## Installation
Use the project install file.  
The installer will backup old settings with a date stamp and create symliks as necessary
```
cd vim 
./install
```
or
```
cd .vim
./install
```

### Init plugins (not needed with installer)
```
cd ~/.vim/
git submodule init
git submodule update
```

Note: for pyflakes or jedi to work correctly, use:
```
git submodule update --init --recursive
```

### Add plugins
```
cd ~/.vim/
mkdir bundle
git submodule add https://github.com/fergusb/vim-foo.git bundle/foo
```

### Update plugins
```
git submodule foreach git pull origin master
git submodule update
```

" vim:ft=mkd
