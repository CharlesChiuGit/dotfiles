#!/usr/bin/zsh

# Alias
alias sozsh='source ~/.zshenv && source ~/.zshrc'
alias nvzsh='nvim ~/.zshrc'
alias nv='nvim'
alias cat='bat'  # wrapper for bat
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
