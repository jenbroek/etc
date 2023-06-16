eval "$(/opt/homebrew/bin/brew shellenv)"

coreutils=$(brew --prefix coreutils)/libexec/gnubin
export GOPATH="$HOME/.go"
export PATH="$HOME/bin:$HOME/.local/bin:$GOPATH/bin:$HOME/.dotnet/tools:$coreutils:$PATH"
export MANPATH="$coreutils:$MANPATH"

export GOROOT="$(brew --prefix go)/libexec"
export DOTNET_ROOT="$(brew --prefix dotnet)/libexec"

export TESTCONTAINERS_DOCKER_SOCKET_OVERRIDE=/var/run/docker.sock
export DOCKER_HOST="unix://$HOME/.colima/default/docker.sock"

export ENV="$HOME/.shrc"
