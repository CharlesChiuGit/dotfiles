#!/usr/bin/sh
set -e

######################################################################
#                          asdf PHP Install                          #
######################################################################
asdf plugin-add php https://github.com/asdf-community/asdf-php.git
asdf install php 8.2.8
asdf global php 8.2.8
