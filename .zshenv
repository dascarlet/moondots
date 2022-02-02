# require this file only once

typeset -U path

path=(
  /bin(N-/)
  /sbin(N-/)
  /usr/local(N-/)
  /usr/local/bin(N-/)
  /usr/local/sbin(N-/)
  /usr/local/anaconda3/bin(N-/)
  /usr/bin(N-/)
  /usr/sbin(N-/)
  /opt/homebrew/bin(N-/)
  
  # for heroku
  /usr/local/heroku/bin(N-/)

  # for anyenv
  ~/.anyenv/bin(N-/)
  ~/.phpenv/bin(N-/)
  ~/.anyenv/envs/pyenv/bin(N-/)
  ~/.anyenv/envs/nodenv/bin(N-/)
  ~/.nodenv/shims(N-/)

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
)
