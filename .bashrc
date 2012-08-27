#!/bin/bash

#export PS1='\h:\w\$ '
#export PS1="\e[1;32m\u\e[0;32m@\h:\e[1;32m\w\e[0;32m$\e[0m "
#export PS1="\033[1;32m\u\033[0;32m@\h:\033[1;32m\w\033[0;32m$\033[0m "
#export PS1="\n[\$(date +%F\" \"%H:%M:%S)] [return code: \[\033[0;31m\]"'($?)'"\[\033[0m\]] \[\033[1;32m\]\u\[\033[0m\]@\[\033[1;37m\]\h\[\033[0m\]:\w\n$0:$(if [ "$(id -u)" == "0" ]; then echo "#"; else echo "$"; fi)> "
export PS1="\[\033[1;37m\]$0:[return code: "'$(last_return_code=$?; if [ $last_return_code -eq 0 ];then echo "("$last_return_code")"; else echo "\[\033[0;31m\]("$last_return_code")"; fi)'"\[\033[1;37m\]]\n\n\[\033[1;37m\]$0:[\$(date +%F\" \"%H:%M:%S\ @%s)] \[\033[1;32m\]\u\[\033[0m\]@\h\n$0:\[\033[1;34m\]\w\[\033[0m\]\n$0:$ "
#export PS1="\u@\h:\w$USERSIGN "
#export PS1="\w\n\u$ "
#export PS1="\w$ "

export      BLUE="\033[0;34m"
export      GREEN="\033[0;32m"
export       RED="\033[0;31m"
export LIGHT_RED="\033[1;31m"
export     WHITE="\033[1;37m"
export  NO_COLOR="\033[0m"


# You may uncomment the following lines if you want `ls' to be colorized:
export TERM=xterm-color
export CLICOLOR=true
#export LSCOLORS=FxGxdxhxcxbxexcxcxFxFx               # Rot
#export LSCOLORS=hxfxcxdxBxegedabagacad              # Grau/Weiss
export LSCOLORS=ExGxFxdxCxDxDxBxBxExEx              # Blau
export EDITOR=vim

alias ll='ls -lA'
alias l='ls -la'
#
# Some more alias to avoid making mistakes:
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ssh="ssh -A"
alias sshx="ssh -X"

alias ..="cd .."
alias ...="cd ../.."

alias svnlastchange="svn di -r 'PREV':'HEAD'"
alias daimlersvn="cd ~/Repositories/emb.daimlerchrysler.com.old/DSCneu/trunk/"
alias dscneu="cd ~/Documents/workspace/dscneu/"


alias grep="grep --color"
alias egrep="egrep --color"
alias fgrep="fgrep --color"
alias p="popd > /dev/null"

alias rsync="rsync -avH --progress"
alias tgz="tar -czvf"
alias tbz="tar -cjvf"

alias setJava14="export JAVA_HOME='/System/Library/Frameworks/JavaVM.framework/Versions/1.4/Home/'"
alias setJava15="export JAVA_HOME='/System/Library/Frameworks/JavaVM.framework/Versions/1.5/Home/'"
alias setJava16="export JAVA_HOME='/System/Library/Frameworks/JavaVM.framework/Versions/1.6/Home/'"

alias prepareJavaKeystoreFor="\$JAVA_HOME/bin/keytool -genkey -keyalg RSA -alias"
alias genTomcatKeystore="\$JAVA_HOME/bin/keytool -genkey -alias tomcat -keyalg RSA -keystore"

alias keepass="mono /Applications/KeePassX/KeePass2_portable/KeePass.exe"

# adding local binaries
export PATH=$PATH:~/bin

# MacPorts Installer addition on 2010-10-28_at_14:50:11: adding an appropriate PATH variable for use with MacPorts.
export PATH=$PATH:/opt/local/bin:/opt/local/sbin
# Finished adapting your PATH environment variable for use with MacPorts.

# adding atlassian plugin sdk
export PATH=$PATH:~/Applications/atlassian-plugin-sdk-3.2.3/bin

function cd
{
    cdcmd="builtin cd"

    if [ "$(echo $@)" != "-" ]; then
        pushd . > /dev/null
    fi
    $cdcmd "$@"

    if [ -d .git ]; then
        isColoredBranch=$(git config --get color.branch)
        echo -e $RED"=> This is a GIT Repository"
        if [ "$isColoredBranch" == "auto" ]; then
            echo -ne $NO_COLOR;
        fi
        git fetch --all -p
        git branch -avv
        echo -ne $NO_COLOR
        remote=$(git config --get remote.origin.url)
        if [ -n "$remote" ]; then
            echo -e $RED"cloned from GIT: "$BLUE$remote$NO_COLOR
        fi
        remote=$(git config --get svn-remote.svn.url)
        if [ -n "$remote" ]; then
            echo -e $RED"cloned from SVN: "$BLUE$remote$NO_COLOR
        fi
    fi
    if [ -d .svn ]; then
        echo -e $RED"=> This is a SVN Repository from: "$BLUE$(svn info | grep ^URL | awk '{print $2}')$NO_COLOR
    fi
    if [ -d CVS ]; then
        echo -e $RED"=> This is a CVS Repository"$NO_COLOR
    fi
}

function nowrap { export COLS=218 ; cut -c- ; unset COLS ; }
