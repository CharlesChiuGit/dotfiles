#!/usr/bin/env bash

# find out which distribution we are running on
LFILE="/etc/os-release"
MFILE="/System/Library/CoreServices/SystemVersion.plist"
if [[ -f $LFILE ]]; then
    _distro=$(awk '/^ID=/' /etc/*-release | awk -F'=' '{ print tolower($2) }' | tr -d '"')
elif [[ -f $MFILE ]]; then
    _distro="macos"
else
    echo "Unsupported distribution"
fi

# set an icon based on the distro
# make sure your font is compatible with https://github.com/lukas-w/font-logos
case $_distro in
    *alpine*) ICON="" ;;
    *aosc*) ICON="" ;;
    *arch*) ICON="" ;;
    *centos*) ICON="" ;;
    *coreos*) ICON="" ;;
    *debian*) ICON="" ;;
    *devuan*) ICON="" ;;
    *elementary*) ICON="" ;;
    *fedora*) ICON="" ;;
    *gentoo*) ICON="" ;;
    *kali*) ICON="ﴣ" ;;
    *linuxmint*) ICON="" ;;
    *macos*) ICON="" ;;
    *mageia*) ICON="" ;;
    *manjaro*) ICON="" ;;
    *nixos*) ICON="" ;;
    *opensuse* | *tumbleweed*) ICON="" ;;
    *raspbian*) ICON="" ;;
    *rhel*) ICON="" ;;
    *sabayon*) ICON="" ;;
    *slackware*) ICON="" ;;
    *ubuntu*) ICON="" ;;
    *void*) ICON="" ;;
    *) ICON="" ;;
esac

export STARSHIP_DISTRO="$ICON"
