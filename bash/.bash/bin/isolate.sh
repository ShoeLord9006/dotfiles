#!/usr/bin/env bash

tmpdir=$(mktemp -d | tee /dev/stderr)
mkdir $tmpdir/config
mkdir $tmpdir/data
mkdir $tmpdir/state
mkdir $tmpdir/cache
export XDG_CONFIG_HOME=$tmpdir/config
export XDG_DATA_HOME=$tmpdir/data
export XDG_STATE_HOME=$tmpdir/state
export XDG_CACHE_HOME=$tmpdir/cache

$@
