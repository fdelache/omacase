# Omacase Architecture

This document explains how Omacase works internally.

## Overview

Omacase is a Zsh-based macOS development environment setup tool. It installs and configures terminal tools, desktop applications, and shell environments with coordinated theming.

**Key Principle**: Everything uses `source` (not subshells). Scripts share state and execute in the same process.

## Directory Structure

```
~/.local/share/omacase/           # OMACASE_PATH
├── boot.sh                       # Initial bootstrap (downloads repo, runs install.sh)
├── install.sh                    # Main installation orchestrator
├── version                       # Version file (currently "0.1")
│
├── bin/
│   ├── omacase                   # Main CLI entry point
│   └── omacase-sub/              # Subcommands
│       ├── menu.sh               # Interactive menu (gum-based)
│       ├── theme.sh              # Theme switcher
│       ├── font.sh               # Font selector
│       ├── font-size.sh          # Terminal font size
│       ├── install.sh            # Re-run installation
│       ├── update.sh             # Update installed apps
│       ├── migrate.sh            # Run migrations
│       └── uninstall.sh          # Uninstall
│
├── install/
│   ├── check-version.sh          # macOS version validation
│   ├── first-run-choices.sh      # Interactive setup choices
│   ├── terminal.sh               # Loops through terminal/*.sh
│   ├── desktop.sh                # Loops through desktop/*.sh
│   ├── terminal/                 # Individual terminal tool installers
│   │   ├── required/             # Always installed first
│   │   │   └── app-gum.sh        # gum (required for interactive UI)
│   │   ├── apps-terminal.sh      # Brew packages (fzf, ripgrep, bat, eza, etc.)
│   │   ├── app-neovim.sh         # Neovim + LazyVim
│   │   ├── app-zellij.sh         # Terminal multiplexer
│   │   ├── app-herdr.sh          # Herdr workspace manager for coding agents
│   │   └── ...
│   └── desktop/                  # Desktop app installers
│       ├── optional/             # User-selected optional apps
│       │   └── app-rubymine.sh
│       ├── app-kitty.sh          # Kitty terminal
│       ├── app-vscode.sh         # VSCode
│       └── fonts.sh              # Nerd Fonts
│
├── defaults/
│   ├── zsh/                      # Shell configuration modules
│   │   ├── rc                    # Master loader (sources all below)
│   │   ├── shell                 # PATH, history, OMACASE_PATH export
│   │   ├── aliases               # Command aliases
│   │   ├── prompt                # Prompt with execution timing
│   │   ├── init                  # Completion and keybindings
│   │   ├── plugins               # zsh-autosuggestions, syntax-highlighting
│   │   ├── functions             # Custom shell functions
│   │   └── zoxide                # Directory jumping config
│   └── kitty/
│       └── zellij.sh             # Zellij launcher script
│
├── configs/                      # Configuration templates (copied during install)
│   ├── zshrc                     # User's ~/.zshrc entry point
│   ├── kitty.conf                # Kitty terminal config
│   ├── zellij.kdl                # Zellij config
│   ├── fastfetch.jsonc           # System info display
│   ├── gitignore                 # Default gitignore
│   ├── vscode/                   # VSCode settings
│   ├── kitty/                    # Kitty sub-configs (fonts, sessions)
│   ├── herdr/                    # Herdr config (cmd+k workspace cycling)
│   └── neovim/                   # Neovim configs
│
├── themes/                       # 7 coordinated themes
│   └── {theme-name}/             # tokyo-night, catppuccin, nord, etc.
│       ├── background.jpg        # Desktop wallpaper
│       ├── kitty-name.theme      # Kitty theme identifier
│       ├── neovim.lua            # Neovim colorscheme plugin
│       ├── zellij.kdl            # Zellij theme
│       └── vscode.sh             # VSCode theme installer
│
├── migrations/                   # Timestamped migration scripts
│   └── {unix-timestamp}.sh       # e.g., 1732291412.sh
│
└── uninstall/                    # Uninstall scripts for specific apps
```

## Installation Flow

### 1. Bootstrap (`boot.sh`)

```
curl -sSL https://franck.isalazy.dev/omacase/install | zsh
```

1. Checks/installs Homebrew
2. Clones repo to `~/.local/share/omacase`
3. Sources `install.sh`

### 2. Main Installation (`install.sh`)

```zsh
set -e
source ~/.local/share/omacase/install/check-version.sh
source ~/.local/share/omacase/install/terminal/required/app-gum.sh  # Required for UI
source ~/.local/share/omacase/install/first-run-choices.sh          # User choices
source ~/.local/share/omacase/install/terminal.sh                   # All terminal tools
source ~/.local/share/omacase/install/desktop.sh                    # All desktop apps
```

### 3. Installer Execution (`terminal.sh` / `desktop.sh`)

Both work the same way - loop through all `.sh` files in the directory:

```zsh
for installer in ~/.local/share/omacase/install/terminal/*.sh; do source $installer; done
```

**Important**: Installers are sourced alphabetically. If order matters, prefix with numbers.

### 4. Individual Installers Pattern

Typical installer (e.g., `app-kitty.sh`):

```zsh
brew install kitty

mkdir -p ~/.config/kitty
cp ~/.local/share/omacase/configs/kitty.conf ~/.config/kitty/kitty.conf
cp ~/.local/share/omacase/configs/kitty/zellij.session ~/.config/kitty/zellij.session
cp ~/.local/share/omacase/configs/kitty/fonts/CaskaydiaMono.conf ~/.config/kitty/font.conf

kitten themes --reload-in=all Tokyo Night
```

Pattern: `brew install` → create directories → copy configs from `configs/` to system locations.

## Shell Configuration Chain

### Entry Point: `~/.zshrc`

The user's `~/.zshrc` is replaced with `configs/zshrc`:

```zsh
source ~/.local/share/omacase/defaults/zsh/rc

export EDITOR="nvim"
export SUDO_EDITOR="$EDITOR"

[[ -x /opt/homebrew/bin/brew ]] && eval $(/opt/homebrew/bin/brew shellenv)
```

### Master Loader: `defaults/zsh/rc`

```zsh
source ~/.local/share/omacase/defaults/zsh/shell
source ~/.local/share/omacase/defaults/zsh/aliases
source ~/.local/share/omacase/defaults/zsh/prompt
source ~/.local/share/omacase/defaults/zsh/init
source ~/.local/share/omacase/defaults/zsh/zoxide
source ~/.local/share/omacase/defaults/zsh/plugins
source ~/.local/share/omacase/defaults/zsh/functions

[ -f ~/.zshenv ] && source ~/.zshenv
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
```

### Shell Module: `defaults/zsh/shell`

```zsh
setopt APPEND_HISTORY
HISTCONTROL=ignoreboth
HISTSIZE=32768
SAVEHIST=$HISTSIZE

autoload -Uz compinit
compinit

export PATH="./bin:$HOME/.local/bin:$HOME/.local/share/omacase/bin:$HOME/.cargo/bin:$PATH"
export OMACASE_PATH="$HOME/.local/share/omacase"
```

## Environment Variables

| Variable | Value | Purpose |
|----------|-------|---------|
| `OMACASE_PATH` | `~/.local/share/omacase` | Base path for all Omacase files |
| `PATH` | Includes `$OMACASE_PATH/bin` | Makes `omacase` command available |
| `EDITOR` | `nvim` | Default editor |
| `OMACASE_FIRST_RUN_OPTIONAL_APPS` | User selection | Controls which optional apps install |

## Theme System

### Theme Switch (`bin/omacase-sub/theme.sh`)

When user selects a theme:

```zsh
# Kitty - uses kitten themes command
kitten themes --reload-in=all $(cat $OMACASE_PATH/themes/$THEME/kitty-name.theme)

# Zellij - copies theme file, updates config
cp "$OMACASE_PATH/themes/$THEME/zellij.kdl" ~/Library/Application\ Support/org.Zellij-Contributors.Zellij/themes/$THEME.kdl
sed -i .bak "s/theme \".*\"/theme \"$THEME\"/g" ~/Library/Application\ Support/org.Zellij-Contributors.Zellij/config.kdl

# Neovim - copies theme plugin
cp "$OMACASE_PATH/themes/$THEME/neovim.lua" ~/.config/nvim/lua/plugins/theme.lua

# VSCode - runs theme installer script
source "$OMACASE_PATH/themes/$THEME/vscode.sh"
```

### Adding a New Theme

Create directory `themes/{theme-name}/` with:
- `kitty-name.theme` - Name of kitty theme (single line)
- `zellij.kdl` - Zellij theme definition
- `neovim.lua` - Neovim colorscheme plugin (LazyVim format)
- `vscode.sh` - Script to install VSCode theme
- `background.jpg` - Optional wallpaper

## Migration System

### Running Migrations (`bin/omacase-sub/migrate.sh`)

```zsh
cd $OMACASE_PATH
last_updated_at=$(git log -1 --format=%cd --date=unix)
git pull

for file in $OMACASE_PATH/migrations/*.sh; do
  filename=$(basename "$file")
  migrate_at="${filename:r}"  # Remove extension, get timestamp

  if [ $migrate_at -gt $last_updated_at ]; then
    echo "Running migration for $migrate_at"
    source $file
  fi
done
```

**Logic**: Only runs migrations with timestamps newer than the last git pull.

### Creating Migrations

Use `create-migration.sh` which creates a file named with current Unix timestamp.

## Configuration File Locations

| Tool | Config Location | Source |
|------|-----------------|--------|
| Zsh | `~/.zshrc` | `configs/zshrc` |
| Kitty | `~/.config/kitty/` | `configs/kitty.conf` + `configs/kitty/` |
| Zellij | `~/Library/Application Support/org.Zellij-Contributors.Zellij/` | `configs/zellij.kdl` |
| Neovim | `~/.config/nvim/` | LazyVim starter + `configs/neovim/` |
| VSCode | Via VSCode settings sync | `configs/vscode/` |
| Git | `~/.gitconfig`, `~/.gitignore` | `configs/gitignore` + `install/terminal/set-git.sh` |

## Extension Points

Omacase provides two extension points for user-specific configuration:

1. **`~/.zshenv`** - Sourced after all Omacase shell modules
2. **`~/.zshrc.local`** - Sourced last, after `~/.zshenv`

Both files are optional and only sourced if they exist.

## Design Patterns

1. **Sourcing over subshells**: All scripts use `source` to share environment
2. **Idempotent installers**: Most check if tool exists before installing
3. **Copy-based config deployment**: Configs are copied, not symlinked
4. **Interactive UI via gum**: Consistent menu experience
5. **Alphabetical execution**: Installers run in alphabetical order
