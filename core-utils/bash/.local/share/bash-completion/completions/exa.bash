_exa()
{
    cur=${COMP_WORDS[COMP_CWORD]}
    prev=${COMP_WORDS[COMP_CWORD-1]}

    case "$prev" in
        -'?'|--help|-v|--version)
            return
            ;;

        --colour)
            COMPREPLY=( $( compgen -W 'always auto never' -- "$cur" ) )
            return
            ;;

        -L|--level)
            COMPREPLY=( $( compgen -W '{0..9}' -- "$cur" ) )
            return
            ;;

        -s|--sort)
            COMPREPLY=( $( compgen -W 'name filename Name Filename size filesize extension Extension date time modified changed accessed created type inode oldest newest age none --' -- "$cur" ) )
            return
            ;;

        -t|--time)
            COMPREPLY=( $( compgen -W 'modified changed accessed created --' -- "$cur" ) )
            return
            ;;

        --time-style)
            COMPREPLY=( $( compgen -W 'default iso long-iso full-iso --' -- "$cur" ) )
            return
            ;;
    esac

    case "$cur" in
        # _parse_help doesn’t pick up short options when they are on the same line than long options
        --*)
            # colo[u]r isn’t parsed correctly so we filter these options out and add them by hand
            parse_help=$( exa --help | grep -oE ' (\-\-[[:alnum:]@-]+)' | tr -d ' ' | grep -v '\-\-colo' )
            completions=$( echo '--color --colour --color-scale --colour-scale' $parse_help )
            COMPREPLY=( $( compgen -W "$completions" -- "$cur" ) )
            ;;

        -*)
            completions=$( exa --help | grep -oE ' (\-[[:alnum:]@])' | tr -d ' ' )
            COMPREPLY=( $( compgen -W "$completions" -- "$cur" ) )
            ;;

        *)
            _filedir
            ;;
    esac
} &&
complete -o filenames -o bashdefault -F _exa exa
