# Lines configured by zsh-newuser-install
function newTerm() {
    /usr/bin/alacritty --working-directory $PWD&disown
}

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
#alias thunar=' thunar `pwd`'
# prompt
PROMPT="[%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m%{$reset_color%} %.]$ "

#source /home/burner/.zshenv
#source /home/burner/.upsman/etc/profile

# gogs-cli
PATH=$PATH:/home/burner/bin
PATH=~/npm-global/bin:$PATH
export PATH
SVN_EDITOR=vim
export SVN_EDITOR
ulimit -c unlimited

alias vim="stty stop '' -ixoff ; vim 2>/dev/null"
# `Frozing' tty, so after any command terminal settings will be restored
ttyctl -f
setxkbmap -option caps:escape

autoload -U select-word-style
select-word-style bash

# Helpful aliases

alias ...=../..
alias ....=../../..
alias .....=../../../..
alias grepr='grep -R'

# Git Aliases
alias g=git
alias ga='git add'
alias gb='git branch'
alias gc='git checkout'
alias ge='git rebase'
alias gf='git fetch --all'
alias gl='git pull'
alias glo='git pull --rebase origin master'
alias glu='git pull --rebase upstream master'
alias gp='git push'
alias gr='git reset --hard'
alias gt='git commit -a'

GCC_COLORS=auto
export GCC_COLORS

setopt HIST_IGNORE_ALL_DUPS
export FZF_DEFAULT_COMMAND='fd --type f'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

