# Various useful functions and aliases

alias please="sudo"

# Prompt yes/no (default is no)
prompt_yn() {
    local response

    printf '$1 [y/N] ' "$message" >&2
    read response
    case "$response" in
        [Yy]|[Yy][Ee][Ss])
            return 0
            ;;
        *)
            return 1
            ;;
    esac
}

test_yn() {
    if prompt_yn "yes or no?"; then
        echo "yes!"
    else
        echo "no!"
    fi
}

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

# Go to folder inside 'ws' and start Neovim
v() {
    cd ~/ws/$1/$2
    vi
}

# Update dotfiles
dfu() {
    pushd ~/dotfiles
    git pull
    popd
}

# File system
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

# Directories
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Suppress 'clear' command so I can scroll up still
alias clear="echo \"did you mean '^L?'\""

# More dangerous Git wrangling
gcan() {
    git status
    prompt_yn "Amend commit with all changes?" && echo "Dry run (would be commit)"
}

# CMake stuff
alias cb="cmake --build"
alias cm="cmake"
alias ct="ctest --output-on-failure"

# Roku helpers
GC_WORKSPACE="~/ws/gc"
gcw() {
    if [ $# -eq 0 ]; then
        echo "No worktree selected"
    else
        local GC_WORKSPACE_PATH=$GC_WORKSPACE/worktrees/$1
        echo $GC_WORKSPACE_PATH
    fi
}

# Reset Warrky capture card
ccr() {
    ~/ws/stream/ccr.sh
}

