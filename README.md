# dotfiles

## Usage

Make sure to clone this repo into the home directory, or the following commands won't work.

For most packages:

```bash
stow <package_name>

```


For `code`, `tmux`, and `oh-my-zsh`,add `--no-folding` argument to symlink files only & avoid random files being placed into the repo:

```bash
stow --no-folding <package_name>

```
