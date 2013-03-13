#!/bin/bash
name=$1
path=$2
bg=

if [ -z "$path" ]; then
    path=$1
fi

if [ -n "$3" ]; then
    bg="~loading bg~"
fi

## double wrap to hide "job finished" information in bash
## TODO: disabled BG load because script changes and functions are not exported from subshell to the parent
##       and therefor not working
#(
#    (
        profileStart=$(date +%s)
        if [ ! -f $path ]; then
            cmdRetCode=128
        else 
            source $path
            cmdRetCode=$?
        fi
        profileEnd=$(bc <<< "$(date +%s)-$profileStart")
        [ -n "$DEBUG" -o "$cmdRetCode" -ne 0 -o -z "$bg" ] && echo -en $GREEN"\n+++ "$name" "$NO_COLOR;
        if [ "$cmdRetCode" -eq 0 ]; then
            [ -n "$DEBUG" -o -z "$bg" ] && echo -e $GREEN"loaded in"$NO_COLOR" (${profileEnd}s)"
        else
            echo -e $RED"failed to load"$NO_COLOR" (${profileEnd}s)"
        fi
        [ -n "$bg" ] && echo -en "$PS0 "
#    ) &
#);
