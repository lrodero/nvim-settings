# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Java
export JAVA_HOME=$(/usr/libexec/java_home)
export PATH=$JAVA_HOME/bin:$PATH

# Ant
export ANT_HOME=/Users/lrodero/Software/apache-ant-1.10.0
export PATH=$ANT_HOME/bin:$PATH

# Apache Maven
export MVN_HOME=/Users/lrodero/Software/apache-maven-3.3.9
export PATH=$MVN_HOME/bin:$PATH

# Vim-Gvim NOT NEEDED, Vim and Gvim configurations are set in .vimrc
# alias vim='vim -c "set expandtab" -c "set tabstop=4" -c "set shiftwidth=4" -c "set nu" -c "syntax on"'
# alias gvim='gvim -c "set expandtab" -c "set tabstop=4" -c "set shiftwidth=4" -c "set nu" -c "set guifont=DejaVu\ Sans\ Mono\ 9" -c "syntax on" '

# Scala
export SCALA_HOME=/Users/lrodero/Software/scala-2.12.2
#export SCALA_HOME=/Users/lrodero/Software/scala-2.11.8
#export SCALA_HOME=/Users/lrodero/Software/scala-2.11.6
#export SCALA_HOME=/home/lrodero/Software/scala-2.10.6
export PATH=$SCALA_HOME/bin:$PATH

# Sbt
export SBT_HOME=/Users/lrodero/Software/sbt-launcher-packaging-0.13.13
export PATH=$SBT_HOME/bin:$PATH
# For certain compilation tasks we need up to 2G of mem available
export SBT_OPTS="-Xmx2G -XX:+UseConcMarkSweepGC -XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=2G -Xss2M"

# For eclipse using the style configuration defined in $HOME/.gtkrc-2.0
export SWT_GTK3=0

# Cassandra
export PATH=/Users/lrodero/Software/apache-cassandra-3.10/bin:$PATH

# Spark
export PATH=/Users/lrodero/Software/spark-2.1.1-bin-hadoop2.7/bin:$PATH

# git-aware prompt
export GITAWAREPROMPT=~/.bash/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"
export PS1="\${debian_chroot:+(\$debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "

# conscript, required to get giter8, which in turn is needed to 
# create play applications with command like sbt new playframework/play-scala-seed.g8
# (see https://playframework.com/documentation/2.5.x/NewApplication)
export CONSCRIPT_HOME=/Users/lrodero/Software/conscript
export CONSCRIPT_OPTS="-XX:MaxPermSize=512M -Dfile.encoding=UTF-8"
export PATH=$CONSCRIPT_HOME/bin:$PATH

# So virtualenvwrapper works (see instructions at
# http://stackoverflow.com/questions/12232421/virtualenvwrapper-commands-arent-working
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh


if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

if [ -f ~/.bash/git-completion.bash ]; then
    . ~/.bash/git-completion.bash
fi

export CONSUL_HOME=/Users/lrodero/Software/consul_0.8.0
export PATH=$CONSUL_HOME:$PATH

# To fix problem with vim not catching some keyboard combinations (Ctrl-w + s)
# See https://stackoverflow.com/questions/13648237/ctrls-horizontal-split-not-working-with-command-t-in-vim/13648667#13648667
stty start undef stop undef

