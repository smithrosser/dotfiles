# dotfiles

## Usage

For most packages:

```bash
stow <package_name>

```
For `code`, `tmux`, and `oh-my-zsh`,add `--no-folding` argument to symlink files only & avoid random files being placed into the repo:

```bash
stow --no-folding <package_name>

```
