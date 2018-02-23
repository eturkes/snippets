#!/bin/sh
# This script updates and adds patent-encumbered codecs to openSUSE

. /etc/os-release
VER=$VERSION_ID

sudo zypper up

if $VER
