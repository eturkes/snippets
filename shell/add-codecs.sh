#!/bin/sh
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
    zypper in libdvdcss2 ffmpeg lame gstreamer-plugins-libav \
        gstreamer-plugins-bad gstreamer-plugins-ugly \
        gstreamer-plugins-ugly-orig-addon vlc vlc-codecs flash-player \
        flash-player-ppapi libxine2 libxine2-codecs
    zypper dup --from packman

    reboot
fi

if [[ "$VER" == *"42.3" ]]; then
    zypper ref
    zypper up

    zypper ar -f http://packman.inode.at/suse/openSUSE_Leap_42.3/ packman
    zypper ar -f http://opensuse-guide.org/repo/openSUSE_Leap_42.3/ libdvdcss
    zypper ref
    zypper in libdvdcss2 ffmpeg lame gstreamer-plugins-libav \
        gstreamer-plugins-bad gstreamer-plugins-ugly \
        gstreamer-plugins-ugly-orig-addon vlc vlc-codecs flash-player \
        flash-player-ppapi libxine2 libxine2-codecs
    zypper dup --from packman

    reboot
fi
