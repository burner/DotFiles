# Lines configured by zsh-newuser-install
LANG=en_US.utf-8
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob nomatch
unsetopt beep notify
bindkey -e

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache 
zstyle :compinstall filename '/home/burner/.zshrc'
zstyle ':completion:*' completer _expand _complete _ignored

autoload -Uz compinit promptinit
compinit
# End of lines added by compinstall

# key bindings
bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line
bindkey "\e[5~" beginning-of-history
bindkey "\e[6~" end-of-history
bindkey "\e[3~" delete-char
bindkey "\e[2~" quoted-insert
bindkey "\e[1;5C" forward-word
bindkey "\eOc" emacs-forward-word
bindkey "\e[1;5D" backward-word
bindkey "\eOd" emacs-backward-word
bindkey "\e\e[C" forward-word
bindkey "\e\e[D" backward-word
bindkey "^H" backward-delete-char

bindkey "^j" backward-char
bindkey "^k" forward-char
bindkey "^b" backward-word
bindkey "^x" delete-char
# for rxvt
bindkey "\e[8~" end-of-line
bindkey "\e[7~" beginning-of-line
# for non RH/Debian xterm, can't hurt for RH/DEbian xterm
bindkey "\eOH" beginning-of-line
bindkey "\eOF" end-of-line
# for freebsd console
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line
# completion in the middle of a line
bindkey '^i' expand-or-complete-prefix

alias ls='ls --color=auto'
alias ll='ls --color=auto -alh'
#alias thunar=' thunar `pwd`'
# prompt
PROMPT='[%n@%M %.]$ '

source /home/burner/.zshenv
#source /home/burner/.upsman/etc/profile

#PATH=$PATH:/home/burner/bin:/home/burner/.upsman/bin
export PATH
SVN_EDITOR=vim
export SVN_EDITOR
ulimit -c unlimited

alias vim="stty stop '' -ixoff ; vim"
# `Frozing' tty, so after any command terminal settings will be restored
ttyctl -f
setxkbmap -option caps:escape

autoload -U select-word-style
select-word-style bash

alias ...=../..
alias ....=../../..
alias .....=../../../..
alias ur="git fetch upstream && git rebase upstream/master"

# Git Alias
alias g=git
alias gl='git pull'
alias gup='git pull --rebase'
alias gt='git commit -a'
alias gc='git checkout'
alias gf='git fetch'
alias gfu='git fetch upstream'
alias gfo='git fetch origin'
alias ga='git add'
alias gr='git reset --hard'

PATH=$PATH:/home/burner/Source/DCD/
export PATH

GCC_COLORS=auto
export GCC_COLORS
