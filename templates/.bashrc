. ~/.shrc

eval "$(rtx activate bash)"

. "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh"
. "$HOMEBREW_PREFIX/etc/bash_completion.d/git-completion.bash"

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
HISTCONTROL=ignoreboth:erasedups

set +o histexpand

shopt -s cdspell
shopt -s dirspell
shopt -s globstar
