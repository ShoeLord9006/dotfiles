#!/bin/sh

lutdir=~/lutris

mkdir $lutdir
mkdir $lutdir/config
mkdir $lutdir/data
mkdir $lutdir/state
mkdir $lutdir/cache
export XDG_CONFIG_HOME=$lutdir/config
export XDG_DATA_HOME=$lutdir/data
export XDG_STATE_HOME=$lutdir/state
export XDG_CACHE_HOME=$lutdir/cache

nix run nixpkgs.lutris -c lutris
