#!/bin/bash

#export PS1='\h:\w\$ '
#export PS1="\e[1;32m\u\e[0;32m@\h:\e[1;32m\w\e[0;32m$\e[0m "
#export PS1="\033[1;32m\u\033[0;32m@\h:\033[1;32m\w\033[0;32m$\033[0m "
#export PS1="\n[\$(date +%F\" \"%H:%M:%S)] [return code: \[\033[0;31m\]"'($?)'"\[\033[0m\]] \[\033[1;32m\]\u\[\033[0m\]@\[\033[1;37m\]\h\[\033[0m\]:\w\n$0:$(if [ "$(id -u)" == "0" ]; then echo "#"; else echo "$"; fi)> "
#export PS1="\[\033[1;37m\]$0:[return code: "'$(last_return_code=$?; if [ $last_return_code -eq 0 ];then echo "("$last_return_code")"; else echo "\[\033[0;31m\]("$last_return_code")"; fi)'"\[\033[1;37m\]]\n\n\[\033[1;37m\]$0:[\$(date +%F\" \"%H:%M:%S\ @%s)] \[\033[1;32m\]\u\[\033[0m\]@\h\n$0:\[\033[1;34m\]\w\[\033[0m\]\n$0:$(if [ $(id -u) -eq 0 ]; then echo '#'; else echo '$'; fi ) >"
export PS1="\[\033[1;37m\]$0:[return code: "'$(last_return_code=$?; if [ $last_return_code -eq 0 ];then echo "("$last_return_code")"; else echo "\[\033[0;31m\]("$last_return_code")"; fi)'"\[\033[1;37m\]]\n\n\[\033[1;37m\]$0:[\$(date +%F\" \"%H:%M:%S\ @%s)] \[\033[1;32m\]\u\[\033[0m\]@\h\n$0:\[\033[1;34m\]\w\[\033[0m\]\n$0:"$(if [ "$(id -u)" -eq 0 ]; then echo "#"; else echo "$"; fi)" "
#export PS1="\u@\h:\w$USERSIGN "
#export PS1="\w\n\u$ "
#export PS1="\w$ "

export      BLUE="\033[0;34m"
export      GREEN="\033[0;32m"
export       RED="\033[0;31m"
export LIGHT_RED="\033[1;31m"
export     WHITE="\033[1;37m"
export  NO_COLOR="\033[0m"


# activate colors in xterm
export TERM=xterm-color
# activate console colors for OS X / FreeBSD
export CLICOLOR=true

## Default colors for console
## http://www.napolitopia.com/2010/03/lscolors-in-osx-snow-leopard-for-dummies/
## order: 
##              DIR
##              | SYM_LINK
##              | | SOCKET
##              | | | PIPE
##              | | | | EXE
##              | | | | | BLOCK_SP
##              | | | | | | CHAR_SP
##              | | | | | | | EXE_SUID
##              | | | | | | | EXE_GUID
##              | | | | | | | | | DIR_STICKY
##              | | | | | | | | | | DIR_WO_STICKY
##              | | | | | | | | | | |
export LSCOLORS=ExGxFxdxCxDxDxBxBxExEx
#export LSCOLORS=FxGxdxhxcxbxexcxcxFxFx
#export LSCOLORS=hxfxcxdxBxegedabagacad

## Alternative LS_COLORS
## seems not to work on OS X / FreeBSD
## http://www.bigsoft.co.uk/blog/index.php/2008/04/11/configuring-ls_colors
#export LS_COLORS="ow=01;90:di=01;90;mi=31"

export EDITOR=vim

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
    echo -e $GREEN"++ bash_completion loaded"$NO_COLOR
    source ~/Applications/bash_completion.d/git-flow-completion.bash
    echo -e $GREEN"++ git-flow-completion loaded"$NO_COLOR
else
    echo -e $RED"-- bash_completion missing"$NO_COLOR
fi

# adding local binaries
export PATH=$PATH:~/bin

# MacPorts Installer addition on 2010-10-28_at_14:50:11: adding an appropriate PATH variable for use with MacPorts.
export PATH=$PATH:/opt/local/bin:/opt/local/sbin
# Finished adapting your PATH environment variable for use with MacPorts.

# adding atlassian plugin sdk
export PATH=$PATH:~/Applications/atlassian-plugin-sdk-3.2.3/bin

# adding atlassian plugin sdk
if [ -f /etc/zce.rc ]; then
    . /etc/zce.rc
fi

if [ -d ~/.bashrc.d ]; then
    for i in ~/.bashrc.d/*; do
        . $i
    done
fi

setJavaJDK
