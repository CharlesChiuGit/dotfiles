#compdef broot

autoload -U is-at-least

_broot() {
    typeset -A opt_args
    typeset -a _arguments_options
    local ret=1

    if is-at-least 5.2; then
        _arguments_options=(-s -S -C)
    else
        _arguments_options=(-s -C)
    fi

    local context curcontext="$curcontext" state line
    _arguments "${_arguments_options[@]}" \
'*--outcmd=[Where to write the produced cmd (if any)]:OUTCMD:_files' \
'*-c+[Semicolon separated commands to execute]:CMD: ' \
'*--cmd=[Semicolon separated commands to execute]:CMD: ' \
'*--color=[Whether to have styles and colors (auto is default and usually OK)]:COLOR:(auto yes no)' \
'*--conf=[Semicolon separated paths to specific config files"),]:CONF: ' \
'*--height=[Height (if you don'\''t want to fill the screen or for file export)]:HEIGHT: ' \
'*--set-install-state=[Where to write the produced cmd (if any)]:SET_INSTALL_STATE:(undefined refused installed)' \
'*--print-shell-function=[Print to stdout the br function for a given shell]:PRINT_SHELL_FUNCTION: ' \
'*--listen=[A socket to listen to for commands]:LISTEN: ' \
'*--write-default-conf=[Write default conf files in given directory]:WRITE_DEFAULT_CONF:_files' \
'*--send=[A socket that broot sends commands to before quitting]:SEND: ' \
'--help[Print help information]' \
'-V[Print version information]' \
'--version[Print version information]' \
'*-d[Show the last modified date of files and directories"]' \
'*--dates[Show the last modified date of files and directories"]' \
'*-D[Don'\''t show the last modified date"]' \
'*--no-dates[Don'\''t show the last modified date"]' \
'*-f[Only show folders]' \
'*--only-folders[Only show folders]' \
'*-F[Show folders and files alike]' \
'*--no-only-folders[Show folders and files alike]' \
'*--show-root-fs[Show filesystem info on top]' \
'*-g[Show git statuses on files and stats on repo]' \
'*--show-git-info[Show git statuses on files and stats on repo]' \
'*-G[Don'\''t show git statuses on files and stats on repo]' \
'*--no-show-git-info[Don'\''t show git statuses on files and stats on repo]' \
'*--git-status[Only show files having an interesting git status, including hidden ones]' \
'*-h[Show hidden files]' \
'*--hidden[Show hidden files]' \
'*-H[Don'\''t show hidden files]' \
'*--no-hidden[Don'\''t show hidden files]' \
'*-i[Show git ignored files]' \
'*--git-ignored[Show git ignored files]' \
'*-I[Don'\''t show git ignored files]' \
'*--no-git-ignored[Don'\''t show git ignored files]' \
'*-p[Show permissions]' \
'*--permissions[Show permissions]' \
'*-P[Don'\''t show permissions]' \
'*--no-permissions[Don'\''t show permissions]' \
'*-s[Show the size of files and directories]' \
'*--sizes[Show the size of files and directories]' \
'*-S[Don'\''t show sizes]' \
'*--no-sizes[Don'\''t show sizes]' \
'*--sort-by-count[Sort by count (only show one level of the tree)]' \
'*--sort-by-date[Sort by date (only show one level of the tree)]' \
'*--sort-by-size[Sort by size (only show one level of the tree)]' \
'*-w[Sort by size, show ignored and hidden files]' \
'*--whale-spotting[Sort by size, show ignored and hidden files]' \
'*--no-sort[Don'\''t sort]' \
'*-t[Trim the root too and don'\''t show a scrollbar]' \
'*--trim-root[Trim the root too and don'\''t show a scrollbar]' \
'*-T[Don'\''t trim the root level, show a scrollbar]' \
'*--no-trim-root[Don'\''t trim the root level, show a scrollbar]' \
'*--install[Install or reinstall the br shell function]' \
'*--get-root[Ask for the current root of the remote broot]' \
'::root -- Root Directory:_files' \
&& ret=0
}

(( $+functions[_broot_commands] )) ||
_broot_commands() {
    local commands; commands=()
    _describe -t commands 'broot commands' commands "$@"
}

_broot "$@"
