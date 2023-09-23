. ~/.shrc

. ~/.asdf/plugins/java/set-java-home.bash
. "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh"
. "$HOMEBREW_PREFIX/etc/bash_completion.d/git-completion.bash"

__git_complete g __git_main
complete -o default -F __start_kubectl k

_PS1_bash() {
	jobcmd='\[$(test \j -gt 0 && printf "(\j) ")\]'
	PS1="$jobcmd$(_PS1)"
}

unset PS1
PROMPT_COMMAND="_PS1_bash;$PROMPT_COMMAND"
PROMPT_DIRTRIM=2

set +o histexpand

shopt -s cdspell
shopt -s dirspell
shopt -s globstar
