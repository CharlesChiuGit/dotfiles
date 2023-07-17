#!/usr/bin/sh
set -e

######################################################################
#                        asdf Python Install                         #
######################################################################
asdf plugin add python
asdf install python 3.11.4
asdf global python 3.11.4
