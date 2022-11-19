#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

######################################################################
#                           Julia Install                            #
######################################################################
JULIA_DIR=$HOME/tools/julia
JULIA_SRC_NAME=$HOME/packages/julia.tar.gz
JULIA_LINK="https://julialangnightlies-s3.julialang.org/bin/linux/x64/julia-latest-linux64.tar.gz"
if [[ ! -f "$JULIA_DIR/bin/julia" ]]; then
    echo "Install Julia"
    if [[ ! -f $JULIA_SRC_NAME ]]; then
        echo "Downloading Julia"
        wget "$JULIA_LINK" -O "$JULIA_SRC_NAME"
    fi

    if [[ ! -d "$JULIA_DIR" ]]; then
        echo "Creating Julia directory under tools directory"
        mkdir -p "$JULIA_DIR"
        echo "Extracting Julia"
        tar -xvzf "$JULIA_SRC_NAME" -C "$JULIA_DIR" --strip-components 1
    fi

    if [[ "$ADD_TO_SYSTEM_PATH" = true ]]; then
        cat <<EOT >>"$RC_FILE"
alias julia='~/tools/julia/bin/julia'
export PATH="$PATH:$HOME/tools/julia/bin"
EOT
    fi
else
    printf "${tty_blue}Julia${tty_reset} is already installed, skip it.\n"

fi
