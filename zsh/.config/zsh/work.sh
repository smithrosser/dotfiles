# Work-related aliases, variables and utilities

## SSH into mousetrap
mtrap() {
    case "$1" in
        "fresh" | "f")
            local NO_TMUX=1
            ssh mt -o SendEnv=NO_TMUX
            ;;
        *)
            ssh mt
            ;;
    esac
}

# Roku helpers
rws() {
    case "$1" in
        "gc")
            cd ~/ws/gc/worktrees/dev/library
            ;;
        "fw")
            cd ~/ws/firmware/worktrees/main
            ;;
        "rpay" )
            cd ~/ws/roku-pay-lib
            ;;
        *)
            echo "Usage: rws [gc, fw, rpay]"
            ;;
    esac
}

# Supercommand for various GC actions
gran() {
    case "$1" in
        "flash" | "f") # Install GC to device (with unit tests)
            make installlibwithtests
            ;;
        "log" | "l") # Open telnet 8885, filter for messages containing TDSR
            [[ $# -lt  2 ]] && { echo "Usage: gran (l)og <port> <pattern (optional)>"; return 1 }

            if [[ "$3" == "" ]]; then
                python3 ~/dotfiles/scripts/gran_log.py $ROKU_DEV_TARGET $2
            else
                python3 ~/dotfiles/scripts/gran_log.py $ROKU_DEV_TARGET $2 $3
            fi
            ;;
        *) # Reject invalid arguments
            echo "Usage: gran [(f)lash, (l)og]"
            ;;
    esac
}

# Reset USB capture card
ccr() {
    ~/ws/stream/ccr.sh
}

# GC Toolbox 'get services payload' wrapper
srp() {
    local basedir="/home/$USER/srp"
    case "$1" in
        "clear")
            rm -rf $basedir/*
            ;;
        "get")
            [[ $# -ne 3 ]] && { echo "usage: srp get [target] [query]"; return 1 }

            local target=$2
            local query=$3
            local outdir="$basedir/$(date +'%Y-%m-%d_%H-%M-%S')_T$target-Q$query"

            mkdir -p $outdir
            get_sr_payload $ROKU_DEV_TARGET --target $target $query -O $outdir || { rm -rf $outdir; return 1 }
            prettier -w $outdir/*.json # format outputted JSON for readability
            ;;
        *)
            echo "usage: srp {get, clear]"
            return 1
            ;;
    esac

}

tnt() {
    telnet $ROKU_DEV_TARGET $1
}

# Enable completions (some Roku setup required it)
autoload -Uz compinit
zstyle ':completion:*' menu select
fpath+=~/.zfunc

# Enable direnv
if [[ "$COMPUTER_NAME" == "mousetrap" ]]; then
    eval "$(direnv hook zsh)"

    # pyenv python version management
    export PYENV_ROOT="$HOME/.pyenv"
    [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init - bash)"
    eval "$(pyenv virtualenv-init -)"

    # Add GC Toolbox to PATH
    export PATH="$PATH:/home/$USER/ws/gc-toolbox/.venv/bin"
fi
