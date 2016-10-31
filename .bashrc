#
# ~/.bashrc
#

source ~/.git-prompt.sh

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '

PS1='\[\033[34m\]\u\[\033[m\]@\[\033[35m\]\h\[\033[01;33m\] \w\[\033[35m\]$(__git_ps1)\[\033[01;34m\] \$\[\033[00m\] '

alias ls='ls -A --color=auto --group-directories-first'
alias ll='ls -lh'
LS_COLORS='no=00:di=32:tw=33;01:ow=33;01'
LS_COLORS=$LS_COLORS':fi=00:ln=00:pi=00:so=00:bd=00:cd=00:or=00:mi=00:ex=00'
LS_COLORS=$LS_COLORS':*.sh=31:*.sh=31:*.exe=31:*.bat=31:*.com=31'
export LS_COLORS

shopt -s cdspell
bind 'set completion-ignore-case on'

function cd {
	builtin cd "$@" && ls -F
}

