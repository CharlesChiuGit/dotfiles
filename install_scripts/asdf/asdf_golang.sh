#!/usr/bin/sh
set -e

######################################################################
#                        asdf Golang Install                         #
######################################################################
asdf plugin-add golang https://github.com/kennyp/asdf-golang.git
asdf install golang 1.20.5
asdf global golang 1.20.5
asdf reshim golang