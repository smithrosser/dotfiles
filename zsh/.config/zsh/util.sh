# Various useful functions and aliases

# Suppress pushd/popd output
pushd() {
  builtin pushd "$@" > /dev/null;
}
popd() {
  builtin popd > /dev/null;
}

# Neovim alias
alias vi="nvim"
alias vilc="nvim leetcode.nvim"

# Edit dotfiles
vivi() {
  pushd ~/dotfiles
  vi
  popd
}

# Quick access to workspace folders
ws () {
  cd ~/ws/$1/$2
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
open() {
  xdg-open "$@" >/dev/null 2>&1 &
}

# Directories
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Suppress 'clear' command so I can scroll up still
alias clear="echo \"did you mean '^L?'\""

# Git wrangling
alias gs="git status"
alias ga="git add -A"
alias gc="git commit -m"
alias gp="git push"
alias gb="git checkout"

# CMake stuff
alias cb="cmake --build"
alias cm="cmake"
alias ct="ctest --output-on-failure"

# Reload .zshrc
rl () {
  echo "Reloading..."
  source ~/.zshrc
}
