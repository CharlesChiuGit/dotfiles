#!/usr/bin/sh
set -e

######################################################################
#                        asdf Nodejs Install                         #
######################################################################
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs 16.16.0
asdf global nodejs 16.16.0
