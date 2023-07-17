#!/usr/bin/sh
set -e

######################################################################
#                         asdf Perl Install                          #
######################################################################
asdf plugin add perl https://github.com/ouest/asdf-perl.git
asdf install perl 5.38.0
asdf global perl 5.38.0
