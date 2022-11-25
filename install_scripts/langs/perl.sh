#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

######################################################################
#                      Perl/Cpan/Cpanm Install                       #
######################################################################
PERL_DIR=$HOME/tools/perl
PERL_SRC_NAME=$HOME/packages/perl.tar.gz
PERL_LINK="https://www.cpan.org/src/5.0/perl-5.36.0.tar.gz"
CPANM_DIR=$HOME/tools/cpanm

if [[ ! -f "$PERL_DIR/bin/perl" ]]; then
    echo "Install perl"
    if [[ ! -f $PERL_SRC_NAME ]]; then
        echo "Downloading Perl and renaming"
        wget $PERL_LINK -O "$PERL_SRC_NAME"
    fi

    if [[ ! -d "$PERL_DIR" ]]; then
        echo "Creating Perl directory under tools directory"
        mkdir -p "$PERL_DIR"
        mkdir -p "$CPANM_DIR"
        echo "Extracting to $HOME/tools/perl directory"
        tar xvf "$PERL_SRC_NAME" -C "$PERL_DIR" --strip-components 1
        cd "$PERL_DIR"
        ./Configure -des -Dprefix="$PERL_DIR"
        make
        make install

        alias perl="~/tools/perl/bin/perl"
        echo "Install cpanm"
        export PERL_CPANM_HOME="$CPANM_DIR"
        curl -L https://cpanmin.us | "$PERL_DIR/bin/perl" - App::cpanminus
    fi

    if [[ "$ADD_TO_SYSTEM_PATH" = true ]]; then
        cat <<EOT >>"$RC_FILE"
alias perl='~/tools/perl/bin/perl'
alias cpan='~/tools/perl/bin/cpan'
alias cpanm='~/tools/perl/bin/cpanm'
export PATH="$PATH:$HOME/tools/perl/bin"
export PERL_CPANM_HOME="$HOME/tools/cpanm"
EOT
    fi
else
    printf "${tty_blue}Perl${tty_reset} is already installed, skip it.\n"
    printf "\t${tty_blue}Cpan${tty_reset} is already installed, skip it.\n"
    printf "\t${tty_blue}Cpanm${tty_reset} is already installed, skip it.\n"
fi

cd ~/dotfiles/install_scripts/
