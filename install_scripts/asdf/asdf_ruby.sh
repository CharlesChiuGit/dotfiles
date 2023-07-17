#!/usr/bin/sh
set -e

######################################################################
#                         asdf Ruby Install                          #
######################################################################
asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
asdf install ruby 3.2.2
asdf global ruby 3.2.2
