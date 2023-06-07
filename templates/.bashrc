. ~/.shrc

. ~/.asdf/plugins/java/set-java-home.bash
. "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh"
. "$HOMEBREW_PREFIX/etc/bash_completion.d/git-completion.bash"

__git_complete g __git_main

_PS1() {
	local e=$? jobcmd cwd branch stage context

	jobcmd='\[$(test \j -gt 0 && printf "(\j) ")\]'

	case $e in
		0) cwd='\[\033[38;5;2m\]\w\[\033[m\]' ;;
		*) cwd='\[\033[38;5;1m\]\w\[\033[m\]' ;;
	esac

	branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)

	if test -n "$branch"; then
		git status --porcelain 2> /dev/null | grep -q '^\w' && stage=1
		git status --porcelain 2> /dev/null | grep -qv '^\w' && stage=$((stage + 2))

		case $stage in
			1) stage='\[\033[38;5;12m\]*\[\033[m\]' ;;
			2) stage='\[\033[38;5;13m\]*\[\033[m\]' ;;
			3) stage='\[\033[38;5;11m\]*\[\033[m\]' ;;
		esac
	fi

	context=$(kubectl config current-context 2> /dev/null)
	test -n "$context" && context="\[\033[38;5;8m\]$context\[\033[m\]"

	PS1=$(set -o noglob; printf '%s ' $jobcmd$cwd $branch $stage $context $'\n→')
	printf '\033]0;%s\007' "${PWD##*/}"
}

unset PS1
PROMPT_COMMAND="_PS1;$PROMPT_COMMAND"
PROMPT_DIRTRIM=2

set +o histexpand

shopt -s cdspell
shopt -s dirspell
shopt -s globstar
