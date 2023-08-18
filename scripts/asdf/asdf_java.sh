#!/usr/bin/sh
set -e

######################################################################
#                         asdf Java Install                          #
######################################################################
asdf plugin-add java https://github.com/halcyon/asdf-java.git
asdf install java openjdk-20.0.1
asdf global java openjdk-20.0.1
