#!/bin/bash
export localRepo=$1;
export remoteRepo=$2;
export startCwd=$CWD;
cd $localRepo;
for f in $(find . -type f -not -wholename "*\.git/*" -not -wholename "*\.metadata/*"); do
    if [ ! -f "$remoteRepo/$f" ]; then
        echo "-- skipped while not in remote Repo: $f";
        continue;
    fi;
    
    if [ -z "$(git log -v $f)" ]; then
        echo "-- skipped while not in local Repo: $f" 1>&2;
        continue;
    fi;
    
    echo -en $BLUE"== $f"$NO_COLOR"\n Local: ";
    export fformat=unix;
    if [ "$(grep -c '' $f)" -eq "0" ]; then
        echo "UNIX format";
    else
        echo "DOS format";
        fformat=dos;
    fi;

    echo -n "Remote: ";
    if [ "$(grep -c '' $remoteRepo/$f)" -eq "0" ]; then
        echo -en $GREEN;
        if [ "$fformat" == "dos" ]; then
            echo -en $RED;
            mv $f $f.conv
        fi;
        echo "UNIX format";

        if [ -f "$f.conv" ]; then
            echo -en $RED" >>convert to UNIX..."$NO_COLOR
            awk '{ sub("\r$", ""); print }' $f.conv > $f
            if [ -z "$(git diff -b $f)" ]; then
                echo -e $GREEN"success"$NO_COLOR
                rm -f $f.conv
            else
                echo -e $RED"FAILED"$NO_COLOR
            fi
        fi
    else
        echo -en $GREEN;
        if [ "$fformat" == "unix" ]; then
            echo -en $RED;
            mv $f $f.conv;
        fi;
        echo "DOS format";

        if [ -f "$f.conv" ]; then
            echo -en $RED" >>convert to DOS..."$NO_COLOR
            awk 'sub("$", "\r")' $f.conv > $f;
            if [ -z "$(git diff -b $f)" ]; then
                echo -e $GREEN"success"$NO_COLOR
                rm -f $f.conv
            else
                echo -e $RED"FAILED"$NO_COLOR
            fi
        fi
    fi;
done;
cd $startCWD
