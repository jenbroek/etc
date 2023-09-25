. ~/.shrc

eval "$(mise activate bash)"

. /etc/profile.d/bash_completion.sh
. /usr/share/bash-completion/completions/git
. /usr/share/bash-completion/completions/kubectl

__git_complete g __git_main
complete -o default -F __start_kubectl k

_PS1_bash() {
	local e=$? jobcmd

	jobcmd='\[$(test \j -gt 0 && printf "(\j) ")\]'
	PS1="$jobcmd$(_PS1 $e)"

	return $e
}

unset PS1
PROMPT_COMMAND="_PS1_bash;$PROMPT_COMMAND"
PROMPT_DIRTRIM=2

trap 'unset HISTFILE' EXIT
HISTCONTROL=ignoreboth:erasedups

set +o histexpand

shopt -s cdspell
shopt -s dirspell
shopt -s globstar
