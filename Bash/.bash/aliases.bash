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
alias py='python3'
alias nvf='nvim `fzf`'
alias ls='exa -1 -l -T -F --colour always --icons -a -L=1 \
    --group-directories-first -b -h --git --time-style long-iso --no-permissions --octal-permissions'
# alias rm='trash' # mv to trash bin
alias lg='lazygit'
alias lzd='lazydocker'
alias CA='conda activate'
alias CD='conda deactivate'
alias tb='tensorboard --logdir'
alias fcd='source ~/.local/bin/fcd' # NOTE: https://askubuntu.com/questions/481715/why-doesnt-cd-work-in-a-shell-script
[[ $TMUX != "" ]] && export TERM="tmux-256color"
alias tmux="~/tools/tmux/tmux -f ~/.config/tmux/tmux.conf"
alias zzf='zoxide query | fzf'
alias rm='rm -iv'
alias mkdir='mkdir -pv'
alias ps='ps auxf'
alias ping='ping -c 5'
alias less='less -R'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias tree='tree -CAF --dirsfirst'
alias treed='tree -CAFd'

# cd to the previous directory
alias bd='cd "$OLDPWD"'

# show open ports
alias openports='netstat -nape --inet'

# reboot
alias rebootsafe='sudo shutdown -r now'
alias rebootforce='sudo shutdown -r -n now'

# Alias's for archives
alias mktar='tar -cvf'
alias mkbz2='tar -cvjf'
alias mkgz='tar -cvzf'
alias untar='tar -xvf'
alias unbz2='tar -xvjf'
alias ungz='tar -xvzf'
