eval "$(/opt/homebrew/bin/brew shellenv)"

coreutils=$(brew --prefix coreutils)/libexec/gnubin
export GOPATH=$HOME/.go
export PATH="$HOME/bin:$HOME/.local/bin:$GOPATH/bin:$coreutils:$PATH"
export MANPATH="$coreutils:$MANPATH"

export ENV=$HOME/.shrc
