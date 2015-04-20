#!/bin/bash

#############
# Variables #
#############

dir=~/dotfiles
files="bashrc vimrc tmux.conf"

##########
# Script #
##########

echo 'Creating symlinks'
for file in $files; do
    ln --symbolic $dir/$file ~/.$file
done

###############
# Vim Plugins #
###############

echo 'Checking for Pathogen...'
if [ ! -f ~/.vim/autoload/pathogen.vim ]; then
    echo -e '\tPathogen not found, installing...'
    mkdir -p ~/.vim/autoload ~/.vim/bundle && \
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
    echo -e '\tPathogen installed successfully.'
else
    echo -e '\tPathogen found, ignoring.'
fi
echo

echo 'Moving to Bundle...'
cd ~/.vim/bundle
echo

echo 'Checking for Ctrlp...'
if [ ! -d ~/.vim/bundle/ctrlp.vim ]; then
    echo -e '\tCtrlp not found, installing...'
    git clone https://github.com/kien/ctrlp.vim
    echo -e '\tCtrlp installed successfully.'
else
    echo -e '\tCtrlp found, ignoring.'
fi
echo

echo 'Checking for Scratch...'
if [ ! -d ~/.vim/bundle/scratch.vim ]; then
    echo -e '\tScratch not found, installing...'
    git clone https://github.com/mtth/scratch.vim
    echo -e '\tScratch installed successfully.'
else
    echo -e '\tScratch found, ignoring.'
fi
echo

echo 'Checking for Syntastic...'
if [ ! -d ~/.vim/bundle/syntastic ]; then
    echo -e '\tSyntastic not found, installing...'
    git clone https://github.com/scrooloose/syntastic
    echo -e '\tSyntastic installed successfully.'
else
    echo -e '\tSyntastic found, ignoring.'
fi
echo

echo 'Checking for Airline...'
if [ ! -d ~/.vim/bundle/vim-airline ]; then
    echo -e '\tAirline not found, installing...'
    git clone https://github.com/bling/vim-airline
    echo -e '\tAirline installed successfully.'
else
    echo -e '\tAirline found, ignoring.'
fi
echo

echo 'Checking for Fugitive...'
if [ ! -d ~/.vim/bundle/vim-fugitive ]; then
    echo -e '\tFugitive not found, installing...'
    git clone https://github.com/tpope/vim-fugitive
    echo -e '\tFugitive installed successfully.'
else
    echo -e '\tFugitive found, ignoring.'
fi
echo

echo 'Checking for Python-Mode...'
if [ ! -d ~/.vim/bundle/python-mode ]; then
    echo -e '\tPython-mode not found, installing...'
    git clone https://github.com/klen/python-mode
    echo -e '\tPython-mode installed successfully.'
else
    echo -e '\tPython-mode found, ignoring.'
fi
echo

echo 'Checking for YouCompleteMe...'
if [ ! -d ~/.vim/bundle/YouCompleteMe ]; then
    echo -e '\tYouCompleteMe not found, installing...'
    git clone https://github.com/Valloric/YouCompleteMe
    echo -e '\tYouCompleteMe installed successfully.'
else
    echo -e '\tYouCompleteMe found, igorning.'
fi
echo

echo 'Checking for Tabular...'
if [ ! -d ~/.vim/bundle/tabular ]; then
    echo -e '\tTabular not found, installing...'
    git clone https://github.com/godlygeek/tabular
    echo -e '\tTabular installed successfully.'
else
    echo -e '\tTabular found, ignoring.'
fi
echo

echo 'Checking for Tagbar...'
if [ ! -d ~/.vim/bundle/tagbar ]; then
    echo -e '\Tagbar not found, installing...'
    git clone https://github.com/majutsushi/tagbar
    echo -e '\tTagbar installed successfully.'
else
    echo -e '\tTagbar found, ignoring.'
fi
echo

echo 'Checking for Patched Fonts...'
if [ ! -d ~/.fonts ]; then
    echo -e '\tPatched Fonts not found, installing...'
    mkdir ~/TempStuff
    cd ~/TempStuff
    git clone https://github.com/powerline/fonts
    cd ~/TempStuff/fonts
    ./install.sh
    cd ~/.vim/bundle
    rm -r ~/TempStuff
    echo -e '\tPatched Fonts Installed. Remember to change to one.'
else
    echo -e '\tPatched Fonts found, ignoring.'
fi
echo

echo 'Script complete.'