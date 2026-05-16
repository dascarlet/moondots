# moondots

dotfiles for dascarlet, managed with [chezmoi](https://www.chezmoi.io/).

## Initial setup (new machine)

```sh
xcode-select --install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install chezmoi
chezmoi init --source ~/moondots git@github.com:dascarlet/moondots.git
chezmoi apply
brew bundle --global
$(brew --prefix)/opt/fzf/install
```

`--source ~/moondots` makes chezmoi use this repo location instead of the default `~/.local/share/chezmoi`.

## Workflow

The source files live in `~/moondots` with the `dot_` prefix (e.g. `dot_zshrc` → `~/.zshrc`). Edit either the source files directly or via:

```sh
chezmoi edit ~/.zshrc      # opens dot_zshrc in $EDITOR
chezmoi diff               # preview what would change in $HOME
chezmoi apply              # write changes from source to $HOME
chezmoi cd                 # cd to source dir (~/moondots)
```

To pull updates from remote and apply them:

```sh
chezmoi update             # git pull + apply
```

To add a new dotfile that already exists in `$HOME`:

```sh
chezmoi add ~/.foorc
```

## Brewfile maintenance

```sh
brew bundle --global       # install everything in ~/.Brewfile
brew bundle dump --global  # regenerate ~/.Brewfile from current state
```
