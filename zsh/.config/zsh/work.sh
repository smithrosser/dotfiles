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
        "grandcentral" | "gc")
            cd ~/ws/gc/worktrees/dev/library
            ;;
        "firmware" | "fw")
            cd ~/ws/firmware/worktrees/main
            ;;
        *)
            echo "Usage: rws [grandcentral | gc, firmware | fw]"
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
            if [[ "$2" == "" ]]; then
                python3 ~/dotfiles/scripts/gran_log.py $ROKU_DEV_TARGET 8885
            else
                python3 ~/dotfiles/scripts/gran_log.py $ROKU_DEV_TARGET 8885 $2
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

# Enable completions (some Roku setup required it)
autoload -Uz compinit
zstyle ':completion:*' menu select
fpath+=~/.zfunc

# Enable direnv
if [[ "$COMPUTER_NAME" == "mousetrap" ]]; then
    eval "$(direnv hook zsh)"
fi
