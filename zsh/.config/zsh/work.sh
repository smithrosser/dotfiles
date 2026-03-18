#
# work.sh
# Work-related shell configuration
#

# Enable completions (some Roku setup somewhere required it)
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
    export PATH="$PATH:/home/$USER/ws/tools/gc-toolbox/.venv/bin"

    # Add zsh config scripts to PATH (e.g. logan-debug.sh)
    export PATH="$PATH:$HOME/.config/zsh"
fi
