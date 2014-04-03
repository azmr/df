#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias cdgo="cd ~/go/src/github.com/azmr && ls"
alias cdaz="cd ~/web/azmr.co.uk && ls"
alias cdem="cd ~/web/embercreations.co.uk && ls"
alias cdsk="cd ~/web/skilledge.org && ls"

alias pacup="sudo pacman -Syu"
alias pac="sudo pacman -S"
alias pacs="pacman -Ss"
alias pacmk="sudo pacman -U"

alias v="vim"
alias vi="vim"


#PS1='\r[\u@\h \w \W]\$ '
PS1="[\t \u@\h] \w :\n\$  "

export PATH=$PATH:~/bin
export GOROOT=/usr/lib/go
export GOPATH=~/go
PATH=$PATH:$GOPATH/bin

setxkbmap -layout gb

export TERM=xterm-256color
setxkbmap -option caps:swapescape
alias git=hub
