_fd() {
    local i cur prev opts cmds
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    cmd=""
    opts=""

    for i in ${COMP_WORDS[@]}
    do
        case "${i}" in
            "$1")
                cmd="fd"
                ;;
            *)
                ;;
        esac
    done

    case "${cmd}" in
        fd)
            opts="-h -V -H -I -u -s -i -g -F -a -l -L -p -0 -d -t -e -x -X -E -c -j -S -1 -q -o --help --version --hidden --no-hidden --no-ignore --ignore --no-ignore-vcs --ignore-vcs --no-ignore-parent --no-global-ignore-file --unrestricted --case-sensitive --ignore-case --glob --regex --fixed-strings --absolute-path --relative-path --list-details --follow --no-follow --full-path --print0 --max-depth --maxdepth --min-depth --exact-depth --prune --type --extension --exec --exec-batch --batch-size --exclude --ignore-file --color --threads --size --max-buffer-time --changed-within --changed-before --max-results --quiet --show-errors --base-directory --path-separator --search-path --strip-cwd-prefix --owner --one-file-system <pattern> <path>..."
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 1 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --max-depth)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -d)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --maxdepth)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --min-depth)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --exact-depth)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --type)
                    COMPREPLY=($(compgen -W "f file d directory l symlink x executable e empty s socket p pipe" -- "${cur}"))
                    return 0
                    ;;
                -t)
                    COMPREPLY=($(compgen -W "f file d directory l symlink x executable e empty s socket p pipe" -- "${cur}"))
                    return 0
                    ;;
                --extension)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -e)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --exec)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -x)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --exec-batch)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -X)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --batch-size)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --exclude)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -E)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --ignore-file)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --color)
                    COMPREPLY=($(compgen -W "never auto always" -- "${cur}"))
                    return 0
                    ;;
                -c)
                    COMPREPLY=($(compgen -W "never auto always" -- "${cur}"))
                    return 0
                    ;;
                --threads)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -j)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --size)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -S)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --max-buffer-time)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --changed-within)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --changed-before)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --max-results)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --base-directory)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --path-separator)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --search-path)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --owner)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -o)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
    esac
}

complete -F _fd -o bashdefault -o default fd
