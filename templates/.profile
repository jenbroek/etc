eval "$(/opt/homebrew/bin/brew shellenv)"

libressl=$(brew --prefix libressl)
coreutils=$(brew --prefix coreutils)/libexec
grep=$(brew --prefix grep)/libexec

safechain="$HOME/.safe-chain/shims"
mise="$HOME/.local/share/mise/shims"

export GOPATH="$HOME/.go"
export PATH="$libressl/bin:$HOME/bin:$HOME/.local/bin:$GOPATH/bin:$coreutils/gnubin:$grep/gnubin:$safechain:$mise:$PATH"
export MANPATH="$coreutils/gnuman:$grep/gnuman:$MANPATH"

export TESTCONTAINERS_DOCKER_SOCKET_OVERRIDE=/var/run/docker.sock
export DOCKER_HOST="unix://$HOME/.colima/default/docker.sock"

export ENV="$HOME/.shrc"

export LANG=en_GB.UTF-8
