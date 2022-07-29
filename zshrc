# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=500000
SAVEHIST=500000
setopt appendhistory autocd extendedglob nomatch
unsetopt beep notify
bindkey -e

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
setopt no_complete_aliases
setopt prompt_subst
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache 
zstyle :compinstall filename '/home/burner/.zshrc'
zstyle ':completion:*' completer _expand _complete _ignored

autoload -Uz compinit promptinit add-zsh-hook
compinit
# End of lines added by compinstall

bindkey "^j" backward-char
bindkey "^k" forward-char
bindkey "^h" backward-word
bindkey "^l" forward-word
bindkey "^n" delete-char

# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -A key

key[Home]=${terminfo[khome]}

key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

# setup key accordingly
[[ -n "${key[Home]}"     ]]  && bindkey  "${key[Home]}"     beginning-of-line
[[ -n "${key[End]}"      ]]  && bindkey  "${key[End]}"      end-of-line
[[ -n "${key[Insert]}"   ]]  && bindkey  "${key[Insert]}"   overwrite-mode
[[ -n "${key[Delete]}"   ]]  && bindkey  "${key[Delete]}"   delete-char
[[ -n "${key[Up]}"       ]]  && bindkey  "${key[Up]}"       up-line-or-history
[[ -n "${key[Down]}"     ]]  && bindkey  "${key[Down]}"     down-line-or-history
[[ -n "${key[Left]}"     ]]  && bindkey  "${key[Left]}"     backward-char
[[ -n "${key[Right]}"    ]]  && bindkey  "${key[Right]}"    forward-char
[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"   beginning-of-buffer-or-history
[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}" end-of-buffer-or-history
bindkey ';5D' emacs-backward-word
bindkey ';5C' emacs-forward-word

zle -N newTerm
bindkey '^n' newTerm


# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
    function zle-line-init () {
        printf '%s' "${terminfo[smkx]}"
    }
    function zle-line-finish () {
        printf '%s' "${terminfo[rmkx]}"
    }
    zle -N zle-line-init
    zle -N zle-line-finish
fi

autoload -U colors && colors

alias ls='ls --color=auto'
alias ll='ls --color=auto -alh'
alias lrt='ls --color=auto -alhrt'
alias psa='ps aux | grep'
#alias thunar=' thunar `pwd`'

#source /home/burner/.zshenv
#source /home/burner/.upsman/etc/profile

# gogs-cli
PATH=~/npm-global/bin:$PATH
PATH=~/bin:$PATH
export PATH
SVN_EDITOR=vim
export SVN_EDITOR
ulimit -c unlimited
export EDITOR=nvim

alias vim="stty stop '' -ixoff ; vim 2>/dev/null"
# `Frozing' tty, so after any command terminal settings will be restored
ttyctl -f
setxkbmap -option caps:escape
setxkbmap de

autoload -U select-word-style
select-word-style bash

# Helpful aliases

alias ...=../..
alias ....=../../..
alias .....=../../../..
alias grepr='grep -n -R'

# Git Aliases
alias g=git
alias ga='git add'
alias gb='git branch'
alias gbs='git branch --sort=committerdate'
alias gc='git checkout'
alias ge='git rebase'
alias gf='git fetch --all'
alias gl='git pull'
alias glo='git pull --rebase origin master'
alias glu='git pull --rebase upstream master'
alias gp='git push'
alias gr='git reset --hard'
alias gt='git commit'
alias gta='git commit -a'
alias gm='git merge'
alias grm='gc master && git fetch && git reset --hard origin/master'

GCC_COLORS=auto
export GCC_COLORS

setopt HIST_IGNORE_ALL_DUPS
#export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_DEFAULT_COMMAND='rg --files --hidden'
#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#
# TaskWarrior
#

function taskwarriorcaller() {
  task $@
  ~/DotFiles/tasksync.sh
}

#alias t='taskwarriorcaller'

source ~/DotFiles/bash_colours
TICK="✓"
CROSS="✗"

URGENT="!"
OVERDUE="☠️"
DUETODAY="💩"

function task_indicator {
    if [ `task +READY +OVERDUE count` -gt "0" ]; then
		PROMPT="[%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m%{$reset_color%} %.]${OVERDUE} "
    elif [ `task +READY +DUETODAY count` -gt "0" ]; then
		PROMPT="[%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m%{$reset_color%} %.]${DUETODAY} "
    elif [ `task +READY urgency \> 10 count` -gt "0" ]; then
		PROMPT="[%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m%{$reset_color%} %.]${URGENT} "
    else
		PROMPT="[%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m%{$reset_color%} %.]\$ "
    fi
}

# prompt

add-zsh-hook precmd task_indicator
setopt PROMPT_SUBST
PS1=${PROMPT}

zstyle ':completion:*:*:task:*' verbose yes
zstyle ':completion:*:*:task:*:descriptions' format '%U%B%d%b%u'

zstyle ':completion:*:*:task:*' group-name ''

alias t='taskwarriorcaller'
alias tn='taskwarriorcaller pro:Work'
compdef _task taskwarriorcaller=task

# Increase the stack
ulimit -S -s 1310720	

# Slic3r
alias slic3r=/home/burner/Slic3r/PrusaSlicer-2.2.0+linux-x64-202003211856/prusa-slicer
