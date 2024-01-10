# require this file only once

typeset -U path

path=(
  # for homebrew
  /opt/homebrew/bin(N-/)
  /opt/homebrew/sbin(N-/)

  # for fig
  ~/.local/bin

  /bin(N-/)
  /sbin(N-/)
  /usr/local(N-/)
  /usr/local/bin(N-/)
  /usr/local/sbin(N-/)
  /usr/local/anaconda3/bin(N-/)
  /usr/bin(N-/)
  /usr/sbin(N-/)
  
  # for heroku
  /usr/local/heroku/bin(N-/)

  # for anyenv
  ~/.anyenv/bin(N-/)
  ~/.phpenv/bin(N-/)
  ~/.anyenv/envs/pyenv/bin(N-/)
  ~/.anyenv/envs/nodenv/bin(N-/)
  ~/.nodenv/shims(N-/)
  ~/.nodenv/bin(N-/)

  # for haskell
  ~/.cabal/bin(N-/)
  ~/Library/Haskell/bin(N-/)
  ~/Library/Haskell/bin/alex(N-/)

  # for pear
  ~/pear/bin(N-/)

  # istioctl
  ~/istio-1.0.6/bin(N-)

  # helm
  /usr/local/opt/helm@2/bin(N-/)

  # Python
  ~/Library/Python/3.9/bin(N-/)

  # for Go
  ~/go/bin(N-/)

  # for yarn global
  ~/.yarn/bin(N-/)
)
