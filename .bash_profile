export PATH=/usr/local/bin:/opt/local/bin:/opt/local/sbin:Work/terminal_math:$PATH

export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH

# ## virtualenvwrapper configs
# export WORKON_HOME=$HOME/.virtualenvs
# export PIP_VIRTUALENV_BASE=$WORKON_HOME
# export PIP_RESPECT_VIRTUALENV=true
# #virtualenv shell script
# source /usr/local/bin/virtualenvwrapper.sh

##### DEFAULTS #####

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

PROMPT_COLOR='35;1m'

export HISTCONTROL=ignoreboth
export HISTTIMEFORMAT="%Y.%m.%d %H:%M:%S "
export HISTSIZE=10000
export EDITOR="emacs"
export VISUAL="emacs"
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

shopt -s histappend
shopt -s checkwinsize

# Make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Color prompt
force_color_prompt=yes

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi


# Easy extract
extract () {
  if [ -f $1 ] ; then
      case $1 in
          *.tar.bz2)   tar xvjf $1    ;;
          *.tar.gz)    tar xvzf $1    ;;
          *.bz2)       bunzip2 $1     ;;
          *.rar)       rar x $1       ;;
          *.gz)        gunzip $1      ;;
          *.tar)       tar xvf $1     ;;
          *.tbz2)      tar xvjf $1    ;;
          *.tgz)       tar xvzf $1    ;;
          *.zip)       unzip $1       ;;
          *.Z)         uncompress $1  ;;
          *.7z)        7z x $1        ;;
          *)           echo "don't know how to extract '$1'..." ;;
      esac
  else
      echo "'$1' is not a valid file!"
  fi
}

# Makes directory then moves into it
function mkcdr {
    mkdir -p -v $1
    cd $1
}

# Creates an archive from given directory
mktar() { tar cvf  "${1%%/}.tar"     "${1%%/}/"; }
mktgz() { tar cvzf "${1%%/}.tar.gz"  "${1%%/}/"; }
mktbz() { tar cvjf "${1%%/}.tar.bz2" "${1%%/}/"; }

### ALIASES
## Keeping things organized
alias ls='ls -G'
alias emacs="open -a /Applications/Emacs.app/Contents/MacOS/Emacs"
#alias em="open -a /Applications/Emacs.app \"$@\""
alias activity_monitor='open /Applications/Utilities/Activity\ Monitor.app'
alias chrome='open -a /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'
alias julia="open -a /Applications/Julia.app"
alias hgpurge='/Work/hgpurge.sh'
alias xmgrace="xmgrace -pipe"
alias gimp="/Applications/Gimp.app/Contents/MacOS/gimp-2.8"

# Finding files
finder()
{
  grep -rn "$1" .
}

# bash_completion for vagrant
if [ -f `brew --prefix`/etc/bash_completion.d/vagrant ]; then
    source `brew --prefix`/etc/bash_completion.d/vagrant
fi

# why rewrite sum each time? fuck that.
function numsum(){
    awk '{ sum+=$1} END {print sum}' $1
}

function mean(){
    awk '{ sum+=$1; lines+=1} END {print sum/lines}' $1
}

function lines(){ 
    if [ $# -eq 3 ];
	then head -n $2 $3 | tail -n $(($2-$1))
	else head -n $1 $2 | tail -n1
    fi
}

function white(){
    sed 's/[\t ]*//' $1
}

function median(){
    head -n $(( $(cat $1 | wc -l ) / 2 )) $1 | tail -n1
}
