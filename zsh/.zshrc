# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Determine which computer zsh is running on
case $(hostname) in
        (LG7790373X) export COMPUTER_NAME="macbook" ;;
        (PT2510011) export COMPUTER_NAME="mousetrap" ;;
        (*)	export COMPUTER_NAME="toaster" ;;
esac

if [[ "$COMPUTER_NAME" == "mousetrap" && "$NO_TMUX" != 1 ]]; then
    #  Automatically start tmux
    if [ -z "$TMUX" ]; then
        # Create or attach to a default session
        tmux new-session -A -s $COMPUTER_NAME
        exit  # Explicitly exit the shell after tmux is done
    fi
fi

# Set theme (or 'random')
ZSH_THEME="chevrons"

# Update oh-my-zsh automatically
zstyle ':omz:update' mode auto

# Enable command auto-correction
ENABLE_CORRECTION="false"

# Speeds up status check for large repos by ignoring untracked files
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Plugins to load (keep it light)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# =======================================================
#  User configuration
# =======================================================


# Node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Extra PATH locations
PATH_ADDITIONS="/home/$USER/.local/bin"
export PATH="$PATH:${PATH_ADDITIONS}"

# Extra utilities, secrets
source ~/.config/zsh/util.sh
source ~/.config/zsh/work.sh
