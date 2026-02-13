# Various useful functions and aliases

alias please="sudo"

# Reload .zshrc
rl() {
    source ~/.zshrc
    echo "Reloaded zsh configuration"
}

# Update & upgrade
auu() {
    sudo apt update
    sudo apt upgrade -y
}

# Suppress pushd/popd output
pushd() {
    builtin pushd "$@" > /dev/null;
}
popd() {
    builtin popd > /dev/null;
}

# Neovim alias
alias vi="nvim"

# Edit dotfiles
vivi() {
    pushd ~/dotfiles
    vi
    popd
}

# Quick access to workspace folders
ws() {
    cd ~/ws/$1/$2
}

# Update dotfiles
dfu() {
    pushd ~/dotfiles
    git pull
    popd
}

# Filesystem
alias ls='eza -lh --group-directories-first --icons=auto'
alias lsa='ls -a'
alias lt='eza --tree --level=2 --long --icons --git'
alias lta='lt -a'
alias ff="fzf --preview 'bat --style=numbers --color=always {}'"
alias cd="zd"
zd() {
    if [ $# -eq 0 ]; then
        builtin cd ~ && return
    elif [ -d "$1" ]; then
        builtin cd "$1"
    else
        z "$@" && printf "\U000F17A9 " && pwd || echo "Error: Directory not found"
    fi
}
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# `grep -i` takes too long
alias grepi="grep -i"

# Suppress 'clear' command so I can scroll up still
clear() {
    echo "did you mean '^L?'"
}

# CMake stuff
alias cb="cmake --build"
alias cm="cmake"
alias ct="ctest --output-on-failure"


