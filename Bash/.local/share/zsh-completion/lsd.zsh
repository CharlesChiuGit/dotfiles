#compdef lsd

autoload -U is-at-least

_lsd() {
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
'*--color=[When to use terminal colours]: :(always auto never)' \
'*--icon=[When to print the icons]: :(always auto never)' \
'*--icon-theme=[Whether to use fancy or unicode icons]: :(fancy unicode)' \
'--config-file=[Provide a custom lsd configuration file]:config-file: ' \
'*--depth=[Stop recursing into directories after reaching specified depth]:num: ' \
'*--permission=[How to display permissions]: :(rwx octal)' \
'*--size=[How to display size]: :(default short bytes)' \
'*--date=[How to display date \[possible values: date, relative, +date-time-format\]]: : ' \
'*--sort=[sort by WORD instead of name]:WORD:(size time version extension none)' \
'*--group-dirs=[Sort the directories then the files]: :(none first last)' \
'*--blocks=[Specify the blocks that will be displayed and in what order]: :(permission user group context size date name inode links)' \
'*-I+[Do not display files/directories with names matching the glob pattern(s). More than one can be specified by repeating the argument]:pattern: ' \
'*--ignore-glob=[Do not display files/directories with names matching the glob pattern(s). More than one can be specified by repeating the argument]:pattern: ' \
'*--hyperlink=[Attach hyperlink to filenames]: :(always auto never)' \
'--help[Print help information]' \
'-V[Print version information]' \
'--version[Print version information]' \
'*-a[Do not ignore entries starting with .]' \
'*--all[Do not ignore entries starting with .]' \
'*-A[Do not list implied . and ..]' \
'*--almost-all[Do not list implied . and ..]' \
'*-F[Append indicator (one of */=>@|) at the end of the file names]' \
'*--classify[Append indicator (one of */=>@|) at the end of the file names]' \
'*-l[Display extended file metadata as a table]' \
'*--long[Display extended file metadata as a table]' \
'--ignore-config[Ignore the configuration file]' \
'*-1[Display one entry per line]' \
'*--oneline[Display one entry per line]' \
'(--tree)*-R[Recurse into directories]' \
'(--tree)*--recursive[Recurse into directories]' \
'*-h[For ls compatibility purposes ONLY, currently set by default]' \
'*--human-readable[For ls compatibility purposes ONLY, currently set by default]' \
'(-R --recursive)*--tree[Recurse into directories and present the result as a tree]' \
'(--depth -R --recursive)-d[Display directories themselves, and not their contents (recursively when used with --tree)]' \
'(--depth -R --recursive)--directory-only[Display directories themselves, and not their contents (recursively when used with --tree)]' \
'*--total-size[Display the total size of directories]' \
'*-t[Sort by time modified]' \
'*--timesort[Sort by time modified]' \
'*-S[Sort by size]' \
'*--sizesort[Sort by size]' \
'*-X[Sort by file extension]' \
'*--extensionsort[Sort by file extension]' \
'*-v[Natural sort of (version) numbers within text]' \
'*--versionsort[Natural sort of (version) numbers within text]' \
'*-U[Do not sort. List entries in directory order]' \
'*--no-sort[Do not sort. List entries in directory order]' \
'*-r[Reverse the order of the sort]' \
'*--reverse[Reverse the order of the sort]' \
'--group-directories-first[Groups the directories at the top before the files. Same as --group-dirs=first]' \
'--classic[Enable classic mode (display output similar to ls)]' \
'*--no-symlink[Do not display symlink target]' \
'*-i[Display the index number of each file]' \
'*--inode[Display the index number of each file]' \
'*-L[When showing file information for a symbolic link, show information for the file the link references rather than for the link itself]' \
'*--dereference[When showing file information for a symbolic link, show information for the file the link references rather than for the link itself]' \
'-Z[Print security context (label) of each file]' \
'--context[Print security context (label) of each file]' \
'--header[Display block headers]' \
'*::FILE:' \
&& ret=0
}

(( $+functions[_lsd_commands] )) ||
_lsd_commands() {
    local commands; commands=()
    _describe -t commands 'lsd commands' commands "$@"
}

_lsd "$@"
