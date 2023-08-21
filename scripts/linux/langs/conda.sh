#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

######################################################################
#               Install Anaconda/Miniconda(Python env)               #
######################################################################

# Anaconda (INSTALL_ANACONDA=true) or Miniconda (INSTALL_ANACONDA=false)
INSTALL_ANACONDA=true

if [[ $INSTALL_ANACONDA = true ]]; then
    CONDA_DIR=$HOME/tools/anaconda
    CONDA_NAME=Anaconda.sh
    CONDA_LINK="https://repo.anaconda.com/archive/Anaconda3-2022.10-Linux-x86_64.sh"
else
    CONDA_DIR=$HOME/tools/miniconda
    CONDA_NAME=Miniconda.sh
    CONDA_LINK="https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh"
fi

if [[ ! -d $CONDA_DIR ]]; then
    echo "Downloading and installing conda"

    if [[ ! -f "$HOME/packages/$CONDA_NAME" ]]; then
        curl -Lo "$HOME/packages/$CONDA_NAME" $CONDA_LINK
    fi

    # Install conda silently
    bash "$HOME/packages/$CONDA_NAME" -b -p "$CONDA_DIR"

    if [[ $ADD_TO_SYSTEM_PATH = true ]]; then
        cat <<EOT >>"$RC_FILE"
# >>> conda initialize >>>
if [ -f $HOME/tools/anaconda/etc/profile.d/conda.sh ]; then
    . "$HOME/tools/anaconda/etc/profile.d/conda.sh"
else
    export PATH="$HOME/tools/anaconda/bin:$PATH"
fi
# <<< conda initialize <<<
EOT
    fi
else
    printf "${tty_blue}Conda(Python)${tty_reset} is already installed, skip it.\n"
fi
