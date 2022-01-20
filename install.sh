#!/bin/sh

mkdir $HOME/.ssh

mkdir -p $HOME/.bash
mkdir -p $HOME/.vim
mkdir -p ~/.config/mako
mkdir -p ~/.config/sway
mkdir -p ~/.config/waybar
mkdir -p ~/.config/kitty

cp bash/.bashrc $HOME/
cp -r bash/.bash $HOME/
cp vim/.vimrc $HOME/
cp -r vim/.vim $HOME/
cp -r mako ~/.config/
cp -r sway ~/.config/
cp -r waybar ~/.config/
cp -r kitty ~/.config/
cp ssh/id_rsa.pub $HOME/.ssh/
