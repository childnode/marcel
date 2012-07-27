#!/bin/bash

# adding local binaries
export PATH=$PATH:~/bin

# MacPorts Installer addition on 2010-10-28_at_14:50:11: adding an appropriate PATH variable for use with MacPorts.
export PATH=$PATH:/opt/local/bin:/opt/local/sbin
# Finished adapting your PATH environment variable for use with MacPorts.

# adding atlassian plugin sdk
export PATH=$PATH:~/Applications/atlassian-plugin-sdk-3.2.3/bin

if [ -d ~/.bashrc.d ]; then
    for i in ~/.bashrc.d/*; do
        . $i
    done
fi

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
    echo -e $GREEN"+++ bash_completion loaded"$NO_COLOR
    source ~/Applications/bash_completion.d/git-flow-completion.bash
    echo -e $GREEN"+++ git-flow-completion loaded"$NO_COLOR
else
    echo -e $RED"--- bash_completion missing"$NO_COLOR
fi

if [ -z "$EDITOR" ]; then
    echo -e $BLUE"(!)"$GREEN" no preferred EDITOR set !"$NO_COLOR
else
    echo -e $GREEN"+++ preferred EDITOR is \`$EDITOR\`"$NO_COLOR
fi

setJavaJDK
