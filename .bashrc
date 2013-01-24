#!/bin/bash

# adding local binaries
export PATH=$PATH:~/bin

# adding local work binaries
for d in $(find ~/bin/ -type d -name work_*); do 
    export PATH=$PATH:$d
done

# MacPorts Installer addition on 2010-10-28_at_14:50:11: adding an appropriate PATH variable for use with MacPorts.
export PATH=$PATH:/opt/local/bin:/opt/local/sbin
# Finished adapting your PATH environment variable for use with MacPorts.

if [ -d ~/.bashrc.d ]; then
    for i in ~/.bashrc.d/*; do
        . $i
    done
fi

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

bc_cmd="/opt/local/etc/bash_completion"
if [ -f "$(which brew)" ]; then
    bc_cmd_brew=$(brew --prefix)"/etc/bash_completion"
    if [ -f "$bc_cmd_brew" ]; then
        bc_cmd=$bc_cmd_brew
    fi
fi

if [ -f "$bc_cmd" ]; then
    echo -e $BLUE"+~~ bash_completion     ~loading bg~ "$NO_COLOR;
    (
        (
            profileStart=$(date +%s);
            . "$bc_cmd" 2>&1 > /dev/null;
            cmdRetCode=$?
            profileEnd=$(bc <<< "$(date +%s)-$profileStart");
            [ -n "$DEBUG" -o "$cmdRetCode" -ne 0 ] && echo -en $GREEN"\n+++ bash_completion "$NO_COLOR;
            if [ "$cmdRetCode" -eq 0 ]; then
                [ -n "$DEBUG" ] && echo -e $GREEN"loaded in"$NO_COLOR" (${profileEnd}s)";
            else
                echo -e $RED"failed to load"$NO_COLOR" (${profileEnd}s)";
            fi
            [ -n "$DEBUG" -o "$cmdRetCode" -ne 0 ] && echo -en "$PS0 "
        ) &
    )

    echo -e $BLUE"+~~ git-flow-completion ~loading bg~ "$NO_COLOR
    (
        (
            profileStart=$(date +%s)
            source ~/Applications/bash_completion.d/git-flow-completion.bash
            cmdRetCode=$?
            profileEnd=$(bc <<< "$(date +%s)-$profileStart")
            [ -n "$DEBUG" -o "$cmdRetCode" -ne 0 ] && echo -en $GREEN"\n+++ git-flow-completion "$NO_COLOR;
            if [ "$cmdRetCode" -eq 0 ]; then
                [ -n "$DEBUG" ] && echo -e $GREEN"loaded in"$NO_COLOR" (${profileEnd}s)"
            else
                echo -e $RED"failed to load"$NO_COLOR" (${profileEnd}s)"
            fi
            [ -n "$DEBUG" -o "$cmdRetCode" -ne 0 ] && echo -en "$PS0 "
        ) &
    )
else
    echo -e $RED"--- bash_completion missing"$NO_COLOR
fi

if [ -z "$EDITOR" ]; then
    echo -e $BLUE"(!)"$GREEN" no preferred EDITOR set !"$NO_COLOR
else
    echo -e $GREEN"+++ preferred EDITOR is \`$EDITOR\`"$NO_COLOR
fi

setJavaJDK
