eval "$(brew shellenv)"

export GOPATH=$HOME/.go
export PATH="$HOME/bin:$HOME/.local/bin:$GOPATH/bin:$HOME/.rd/bin:/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnubin:$MANPATH"

export ENV=$HOME/.shrc
