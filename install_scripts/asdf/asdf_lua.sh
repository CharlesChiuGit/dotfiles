#!/usr/bin/sh
set -e

######################################################################
#                          asdf Lua Install                          #
######################################################################
asdf plugin-add lua https://github.com/Stratus3D/asdf-lua.git
asdf install lua 5.4.6
asdf global lua 5.4.6
