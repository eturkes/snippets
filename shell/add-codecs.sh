#!/bin/sh
# This script updates and adds patent-encumbered codecs to openSUSE

VER=`lsb_release -r`

if [[ "$VER" == *"42.3" ]]; then
    echo success
fi

#sudo zypper up

#if $VER
