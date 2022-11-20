#!/usr/bin/zsh

# Alias
alias sozsh='source ~/.zshenv && source ~/.zshrc'
alias nvzsh='nvim ~/.zshrc'
alias nv='nvim'
alias cat='bat'  # wrapper for bat
alias py='python'
alias nvf='nvim `fzf`'
alias ls='exa -1 -l -T -F --colour always --icons -a -L=1 \
    --group-directories-first -b -h --git --time-style long-iso --no-permissions --octal-permissions'
alias rm='trash' # mv to trash bin
alias lg='lazygit'
alias CA='conda activate'
alias CD='conda deactivate'
alias tb='tensorboard --logdir'
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
