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


alias ls='ls --color=auto'
alias ll='ls --color=auto -alh'
#alias thunar=' thunar `pwd`'
# prompt
PROMPT='[%n@%M %.]$ '

#source /home/burner/.zshenv
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
alias gb='git branch'
alias ge='git rebase'
alias gh='git rebase -i HEAD~'

PATH=$PATH:/home/burner/bin:/home/burner/Source/Dscanner/Dscanner/
export PATH

GCC_COLORS=auto
export GCC_COLORS
