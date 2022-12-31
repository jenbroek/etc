_PS1() {
	local e=$? cwd branch stage

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

	local jobcmd='\[$(test \j -gt 0 && printf "(\j) ")\]'

	PS1=$(set -o noglob; printf '%s ' $jobcmd$cwd $branch $stage $'\n→')
	printf '\033]0;%s\007' "${PWD##*/}"
}

colors() {
	for i in $(seq 0 15); do
		printf "\033[38;5;${i}m███\033[m"
		test $i = 7 || test $i = 15 && echo
	done
}

. ~/.asdf/plugins/java/set-java-home.bash
. "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh"
for f in "$HOMEBREW_PREFIX/etc/bash_completion.d/"*; do
	. "$f"
done

__git_complete g __git_main

alias g=git

alias tree='tree -CF --dirsfirst'
alias grep='grep --color'
alias diff='diff -u --color'
alias diffc='diff --color=always'
alias lessr='less -R'
alias cat='cat -v'

alias ls='ls -F --color --group-directories-first'
alias la='ls -A'
alias ll='ls -hl'
alias lla='ls -Ahl'

alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

unset PS1
PROMPT_COMMAND="_PS1;$PROMPT_COMMAND"
PROMPT_DIRTRIM=2

export EDITOR=nvim
export LESSHISTFILE=-
export GPG_TTY=$(tty)

set +o histexpand

shopt -s cdspell
shopt -s dirspell
shopt -s globstar
