# moondots

dotfiles for dascarlet

### usage
```
cd ~
git clone git@github.com:dascarlet/moondots.git
cd moondots
./drop.sh        # uses GNU stow if available, otherwise plain symlinks
```

`drop.sh` is idempotent — re-run it after pulling changes.

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
