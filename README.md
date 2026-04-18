# dotfiles

## About

My dotfiles for:

- Alacritty (credits to Fatih Arslan. [His post on the topic](https://arslan.io/2018/02/05/gpu-accelerated-terminal-alacritty/))
- Git
- Mise
- NeoVim
- Tmux (credits to Fatih Arslan. [His post on the topic](https://arslan.io/2018/02/05/gpu-accelerated-terminal-alacritty/))
- Vim
- Zsh
- some other stuff

Manged by GNU Stow

## Usage

Order of execution matters!

```bash
make system    # installs system packages
make stow      # create symlinks
make mise      # install devtools
make shell     # install zsh things
```
