# zsh config

## oh-my-zsh plugins
plugins=(
  git
  docker
  zsh-syntax-highlighting
)

# oh-my-zsh
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="wedisagree"
[ -f $ZSH/oh-my-zsh.sh ] && source $ZSH/oh-my-zsh.sh
export ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%} ♜"
export ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[magenta]%} ♣"
export ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg[blue]%} ✤"

# lang
export LC_CTYPE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"

# cd & ls
cd ()
{
    builtin cd "$@" && ls
}

# for history
export HISTSIZE=10000
export HISTCONTROL=ignoreboth:erasedups
export HISTTIMEFORMAT='%Y-%m-%d %T%z '
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_NO_STORE
setopt HIST_SAVE_NO_DUPS

# zoxide (smarter cd; use `z <pattern>` to jump)
command -v zoxide >/dev/null && eval "$(zoxide init zsh)"

# fzf (Ctrl-R history search etc.)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# for golang
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# for zsh
bindkey -e

# zsh-syntax-highlighting (brew)
for d in /opt/homebrew/share/zsh-syntax-highlighting /usr/local/share/zsh-syntax-highlighting; do
  [ -f "$d/zsh-syntax-highlighting.zsh" ] && source "$d/zsh-syntax-highlighting.zsh" && break
done

# direnv
export EDITOR=vim
command -v direnv >/dev/null && eval "$(direnv hook zsh)"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# for phpstorm terminal
[[ -f ~/.zshenv ]] && source ~/.zshenv

# source local
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

# source aliases
[ -f ~/.aliases ] && source ~/.aliases

# completions
fpath=($HOME/.zsh/completion $fpath)
if command -v brew >/dev/null; then
  fpath=("$(brew --prefix)/share/zsh-completions" "$(brew --prefix)/share/zsh/site-functions" $fpath)
fi
autoload -Uz compinit
compinit

# Google Cloud SDK
[ -f "$HOME/google-cloud-sdk/path.zsh.inc" ] && . "$HOME/google-cloud-sdk/path.zsh.inc"
[ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ] && . "$HOME/google-cloud-sdk/completion.zsh.inc"

# version manager
eval "$(mise activate zsh)"
