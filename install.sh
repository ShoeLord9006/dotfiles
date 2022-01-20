#!/bin/sh

mkdir $HOME/.ssh

cp bash/.bashrc $HOME/
cp -r bash/.bash $HOME/
cp vim/.vimrc $HOME/
cp -r vim/.vim $HOME/
cp -r mako $XDG_CONFIG_HOME/
cp -r sway $XDG_CONFIG_HOME/
cp -r waybar $XDG_CONFIG_HOME/
cp -r kitty $XDG_CONFIG_HOME/
cp ssh/id_rsa.pub $HOME/.ssh/
