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

# Always show hidden files with ls
alias ls="ls -ah --color=auto"
alias ll="ls -al --color=auto"

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
