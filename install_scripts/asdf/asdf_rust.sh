#!/usr/bin/sh
set -e

######################################################################
#                         asdf Rust Install                          #
######################################################################
asdf plugin-add rust https://github.com/asdf-community/asdf-rust.git
asdf install rust 1.70.0
asdf global rust 1.70.0
