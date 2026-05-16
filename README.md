# moondots

dotfiles for dascarlet

### usage
```
cd ~
git clone git@github.com:dascarlet/moondots.git
cd moondots
./drop.sh
```

`drop.sh` is idempotent — re-run it after pulling changes. Existing non-symlink files at the target are kept (skipped with a warning).

### install homebrew packages
```
xcode-select --install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew bundle --global
```

After installing fzf for the first time, run `$(brew --prefix)/opt/fzf/install` to generate `~/.fzf.zsh`.

### dump homebrew packages
```
brew bundle dump --global
```
