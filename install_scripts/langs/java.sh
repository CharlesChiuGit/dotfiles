#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

######################################################################
#                          Java/JDK Install                          #
######################################################################
JAVA_DIR=$HOME/tools/java
JAVA_SRC_NAME=$HOME/packages/java.tar.gz
JAVA_LINK="https://download.java.net/java/GA/jdk18.0.2/f6ad4b4450fd4d298113270ec84f30ee/9/GPL/openjdk-18.0.2_linux-x64_bin.tar.gz"
if [[ ! -f "$JAVA_DIR/bin/java" ]]; then
    echo "Install JAVA"
    if [[ ! -f $JAVA_SRC_NAME ]]; then
        echo "Downloading Java"
        wget "$JAVA_LINK" -O "$JAVA_SRC_NAME"
    fi

    if [[ ! -d "$JAVA_DIR" ]]; then
        echo "Creating Java directory under tools directory"
        mkdir -p "$JAVA_DIR"
        echo "Extracting Java"
        tar -xvf "$JAVA_SRC_NAME" -C "$JAVA_DIR" --strip-components 1
    fi

    if [[ "$ADD_TO_SYSTEM_PATH" = true ]]; then
        cat <<EOT >>"$RC_FILE"
alias java='~/tools/jdk/bin/java'
alias javac='~/tools/jdk/bin/javac'
export PATH="$PATH:$HOME/tools/java/bin"
EOT
    fi
else
    printf "${tty_blue}Java${tty_reset} is already installed, skip it.\n"
fi
