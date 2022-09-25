#!/usr/bin/env bash

# Local tools alias
alias node='~/tools/nodejs/bin/node'
alias npm='~/tools/nodejs/bin/npm'
alias perl='~/tools/perl/bin/perl'
alias cpan='~/tools/perl/bin/cpan'
alias cpanm='~/tools/perl/bin/cpanm'
alias ruby='~/tools/ruby/bin/ruby'
alias go='~/tools/golang/bin/go'
alias java='~/tools/jdk/bin/java'
alias javac='~/tools/jdk/bin/javac'
alias julia='~/tools/julia/bin/julia'
alias lua='~/tools/lua/src/lua'
alias luajit='~/tools/luajit/src/luajit'
alias luarocks='~/tools/luarocks/luarocks'
alias php='~/tools/php/bin/php'
alias tmux='~/tools/tmux/tmux'

# Alias
alias sudo='sudo '
alias apt='nala' # nala, wrapper for apt-get
alias bat='bat --theme=gruvbox-dark --color=always --style=numbers,changes,header,grid --line-range :500' # bat option
# alias fzf="fzf --preview 'bat --theme=gruvbox-dark --color=always --style=numbers,changes,header,grid --line-range :500 {}'"
# alias fzfimg="fzf --preview '(~/.cargo/bin/termpix --width 50 --true-color {} || cat {}) 2> /dev/null'"
alias fzf="fzf --header 'E to edit' --preview='pistol {}' --bind 'E:execute(vi {})'"
alias nvim='$HOME/tools/nvim/bin/nvim'
alias sobash='source ~/.bashrc'
alias nvbash='nvim ~/.bashrc'
alias py='python'
alias nv='nvim' # Neovim
alias nvf='nvim `fzf`'
alias ls='lsd -lFA' # Pretty ls
alias cat='bat' # wrapper for bat
alias rm='trash' # mv to trash-bin
alias ntfy='ntfy.exe -t '"'charles@WSL'"' ' # ntfy, wsl wrapper for ntfy in windows
alias tat='tmux a -t'
alias tks='tmux kill-session -t'
alias CA='conda activate'
alias CD='conda deactivate'
alias tb='tensorboard --logdir'
alias xcd='cd "$(xplr --print-pwd-as-result)"'
