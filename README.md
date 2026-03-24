# Dotfiles

Personal configuration files for Zsh, Neovim, and Ghostty.

## Prerequisites

- macOS with [Homebrew](https://brew.sh/) installed
- [Oh My Zsh](https://ohmyz.sh/)

## Setup

### 1. Clone the repo

```bash
git clone git@github.com:WictorSvensson/dotfiles.git ~/Develop/dotfiles
```

### 2. Install dependencies

```bash
brew bundle --file ~/Develop/dotfiles/Brewfile
```

This installs Zsh, Neovim, Node.js, ripgrep, lazygit, gh, the JetBrainsMono Nerd Font, and Ghostty.

### 3. Create symlinks

```bash
# Zsh
ln -sf ~/Develop/dotfiles/.zshrc ~/.zshrc

# Neovim
ln -sfn ~/Develop/dotfiles/nvim ~/.config/nvim

# Ghostty
mkdir -p ~/.config/ghostty
ln -sfn ~/Develop/dotfiles/ghostty/config ~/.config/ghostty/config
```

### 4. Reload Zsh

```bash
source ~/.zshrc
```

Neovim will automatically install plugins via [lazy.nvim](https://github.com/folke/lazy.nvim) on first launch.

## Keeping in sync

Pull the latest changes on a new or existing machine:

```bash
git -C ~/Develop/dotfiles pull
```

Save local changes back to the repo:

```bash
git -C ~/Develop/dotfiles add .
git -C ~/Develop/dotfiles commit -m "update configs"
git -C ~/Develop/dotfiles push
```

## Config locations

| File in repo          | Destination                    |
|-----------------------|--------------------------------|
| `Brewfile`            | —                              |
| `.zshrc`              | `~/.zshrc`                     |
| `nvim/`               | `~/.config/nvim/`              |
| `ghostty/config`      | `~/.config/ghostty/config`     |
