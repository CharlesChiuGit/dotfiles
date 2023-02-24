#!/usr/bin/env bash

# Local tools alias
alias node='~/tools/nodejs/bin/node'
alias npm='~/tools/nodejs/bin/npm'
alias npx='~/tools/nodejs/bin/npx'
alias perl='~/tools/perl/bin/perl'
alias cpan='~/tools/perl/bin/cpan'
alias cpanm='~/tools/perl/bin/cpanm'
alias ruby='~/tools/ruby/bin/ruby'
alias go='~/tools/golang/bin/go'
alias java='~/tools/java/bin/java'
alias javac='~/tools/java/bin/javac'
alias julia='~/tools/julia/bin/julia'
alias lua='~/tools/lua/src/lua'
alias luajit='~/tools/luajit/src/luajit'
alias luarocks='~/tools/luarocks/luarocks'
alias php='~/tools/php/bin/php'

# Alias
alias sudo='sudo '
alias apt='nala'
alias sobash='source ~/.bashrc'
alias nvbash='nvim ~/.bashrc'
alias nv='nvim'
alias cat='bat' # wrapper for bat
alias py='python'
alias nvf='nvim `fzf`'
alias ls='exa -1 -l -T -F --colour always --icons -a -L=1 \
    --group-directories-first -b -h --git --time-style long-iso --no-permissions --octal-permissions'
alias rm='trash' # mv to trash bin
alias lg='lazygit'
alias lzd='lazydocker'
alias CA='conda activate'
alias CD='conda deactivate'
alias tb='tensorboard --logdir'
alias fcd='source ~/.local/bin/fcd' # NOTE: https://askubuntu.com/questions/481715/why-doesnt-cd-work-in-a-shell-script
[[ $TMUX != "" ]] && export TERM="tmux-256color"
alias tmux="~/tools/tmux/tmux -f ~/.config/tmux/tmux.conf"

# upgrep Alias
alias uq='ug -Q'  # short & quick query TUI (interactive, uses .ugrep config)
alias ux='ug -UX' # short & quick binary pattern search (uses .ugrep config)
alias uz='ug -z'  # short & quick compressed files and archives search (uses .ugrep config)

alias ugit='ug -R --ignore-files' # works like git-grep & define your preferences in .ugrep config

alias grep='ugrep -G'  # search with basic regular expressions (BRE)
alias egrep='ugrep -E' # search with extended regular expressions (ERE)
alias fgrep='ugrep -F' # find string(s)
alias pgrep='ugrep -P' # search with Perl regular expressions
alias xgrep='ugrep -W' # search (ERE) and output text or hex for binary

alias zgrep='ugrep -zG'  # search compressed files and archives with BRE
alias zegrep='ugrep -zE' # search compressed files and archives with ERE
alias zfgrep='ugrep -zF' # find string(s) in compressed files and/or archives
alias zpgrep='ugrep -zP' # search compressed files and archives with Perl regular expressions
alias zxgrep='ugrep -zW' # search (ERE) compressed files/archives and output text or hex for binary

alias xdump='ugrep -X ""' # hexdump files without searching
