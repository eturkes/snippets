#!/bin/sh

# Copyright 2018 Emir Turkes
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# This script updates and adds patent-encumbered codecs to openSUSE

VER=`lsb_release -r`

if [[ "$VER" == *"42.2" ]]; then
    zypper ref
    zypper up

    cp -Rv /etc/zypp/repos.d /etc/zypp/repos.d.Old
    sed -i 's/42\.2/42.3/g' /etc/zypp/repos.d/*
    zypper ref
    zypper dup

    zypper ar -f http://packman.inode.at/suse/openSUSE_Leap_42.3/ packman
    zypper ar -f http://opensuse-guide.org/repo/openSUSE_Leap_42.3/ libdvdcss
    zypper ref
    zypper in libdvdcss2 ffmpeg lame gstreamer-plugins-libav gstreamer-plugins-bad \
        gstreamer-plugins-ugly gstreamer-plugins-ugly-orig-addon vlc vlc-codecs \
        flash-player flash-player-ppapi libxine2 libxine2-codecs
    zypper dup --from packman

    reboot
fi

if [[ "$VER" == *"42.3" ]]; then
    zypper ref
    zypper up

    zypper ar -f http://packman.inode.at/suse/openSUSE_Leap_42.3/ packman
    zypper ar -f http://opensuse-guide.org/repo/openSUSE_Leap_42.3/ libdvdcss
    zypper ref
    zypper in libdvdcss2 ffmpeg lame gstreamer-plugins-libav gstreamer-plugins-bad \
        gstreamer-plugins-ugly gstreamer-plugins-ugly-orig-addon vlc vlc-codecs \
        flash-player flash-player-ppapi libxine2 libxine2-codecs
    zypper dup --from packman

    reboot
fi
