# zsh config

## oh-my-zsh plugins
plugins=(
  zsh-kubectl-prompt
  docker
  zsh-syntax-highlighting
)

# oh-my-zsh
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="wedisagree"
[ -f $ZSH/oh-my-zsh.sh  ] && source $ZSH/oh-my-zsh.sh
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

# enhancd
[ -f ~/.enhancd ] && source ~/.enhancd/zsh/enhancd.zsh

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# colordiff
if [[ -x `which colordiff` ]]; then
  alias diff='colordiff -u'
else
  alias diff='diff -u'
fi

# for golang
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# for zsh
bindkey -e

# peco history search
function peco-select-history() {
	local tac
	if which tac > /dev/null; then
		tac="tac"
	else
		tac="tail -r"
	fi
	BUFFER=$(\history -n 1 | \
	eval $tac | \
	peco --query "$LBUFFER" | \
  sed 's/\\n/\n/')
	CURSOR=$#BUFFER
	zle clear-screen
}

zle -N peco-select-history
bindkey '^r' peco-select-history

# highlighting
[ -f /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && \
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# for direnv
[ -f /usr/local/bin/direnv ] && \
export EDITOR=vim &&
eval "$(direnv hook zsh)"

## for nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

## for kubernetes completion
source <(kubectl completion zsh)

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/kz-scarlet/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/kz-scarlet/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/kz-scarlet/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/kz-scarlet/google-cloud-sdk/completion.zsh.inc'; fi

# for stern
source <(stern --completion=zsh)

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# for iTerm2 status bar
iterm2_print_user_vars() {
  iterm2_set_user_var kubecontext $(kubectl config current-context)
}
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# for phpstorm terminal
[[ -f ~/.zshenv ]] && source ~/.zshenv

export PYENV_ROOT="$HOME/.anyenv/envs/pyenv"
eval "$(pyenv init --path)"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# source local
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

# source aliases
[ -f ~/.aliases ] && source ~/.aliases

# for auto complete
autoload -U compinit
compinit
