# pistol mime preview
zstyle ':fzf-tab:complete:*:*' fzf-preview 'pistol ${(Q)realpath}'
zstyle ':fzf-tab:complete:*:*' fzf-flags --height=60%

# give a preview of commandline arguments when completing `kill`
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"
zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-preview \
    '[[ $group == "[process ID]" ]] && ps --pid=$word -o cmd --no-headers -w -w'
zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-flags --header="[process ID]" --preview-window=down:3:wrap

# show systemd unit status
zstyle ':fzf-tab:complete:systemctl-*:*' fzf-preview 'SYSTEMD_COLORS=1 systemctl status $word'

# show runit unit status
zstyle ':fzf-tab:complete:sv:*' fzf-preview 'sudo sv status $word'

# show environment variable
zstyle ':fzf-tab:complete:(-command-|-parameter-|-brace-parameter-|export|unset|expand):*' \
    fzf-preview 'echo ${(P)word}'

# show alias
zstyle ':fzf-tab:complete:alias:*' fzf-preview 'alias $word'

# show tldr
zstyle ':fzf-tab:complete:tldr:argument-1' fzf-preview 'tldr --color always $word'

# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false

# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'

# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 -h --color=always $realpath'

# basic file preview for ls (you can replace with something more sophisticated than head)
zstyle ':completion::*:ls::*' fzf-preview='eval head {1}'

# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'

# show command manual
zstyle ':fzf-tab:complete:-command-:*' fzf-preview \
    '(out=$(tldr --color always "$word") 2>/dev/null && echo $out) || (out=$(MANWIDTH=$FZF_PREVIEW_COLUMNS man "$word") 2>/dev/null && echo $out) || (out=$(which "$word") && echo $out) || echo "${(P)word}"'

# man or help
zstyle ':fzf-tab:complete:(\\|)run-help:*' fzf-preview 'run-help $word'
zstyle ':fzf-tab:complete:(\\|*/|)man:*' fzf-preview 'man $word'

# ssh
## remove all previous ssh hosts
compdef -d ssh
## define new ssh hosts
function _ssh_hosts() {
    compadd $(command cat <(command tail -n +1 ~/.ssh/config 2> /dev/null ) | \
                command grep -i '^\s*host\(name\)\? ' | \
                awk '{for (i=2;i<=NF;i++) print $1 " " $i}' | \
                command grep -v '[*?%]' | \
                awk '/^Host/ {print $2}' | awk 'NR % 2 == 1' | sort -u
            )
}
compdef _ssh_hosts ssh
function get_ssh_hostname() {
    ssh -Gtt $1 | awk '$1 == "hostname" { print $2 }'
}
zstyle ':fzf-tab:complete:ssh:*' fzf-preview 'get_ssh_hostname $word'
