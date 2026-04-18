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

Install some system dependencies:

```bash
sudo dnf install gcc clang
sudo dnf install glib2 glib2-devel
sudo dnf install python3-devel
sudo dnf install openssl-devel
sudo dnf install libyaml-devel
```

Create symlinks with `stow`:

```bash
make stow
```

Run `mise`:

```bash
mise install
```
