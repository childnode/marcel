#!/usr/bin/env bash

# adding local binaries
export PATH=$PATH:~/bin

# adding local work binaries
for d in $(find ~/bin/ -type d -name work_*); do 
    export PATH=$PATH:$d
done

# MacPorts Installer addition on 2010-10-28_at_14:50:11: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export DYLD_LIBRARY_PATH=/opt/local/lib/:/usr/lib/:$DYLD_LIBRARY_PATH

## reload bash if there is a newer version available
bash=${BASH_VERSION%.*}; bmajor=${bash%.*}; bminor=${bash#*.}
newbash=$(bash -c "echo \${BASH_VERSION%.*}"); newbmajor=${newbash%.*}; newbminor=${newbash#*.}
if [ $newbmajor -gt $bmajor ] || [ $bmajor -eq $newbmajor -a $newbminor -gt $bminor ]; then
    bash && exit 0;
fi

unset bash bmajor bminor;

# Finished adapting your PATH environment variable for use with MacPorts.

if [ -d ~/.bashrc.d ]; then
    for i in ~/.bashrc.d/*; do
        if [ -f $i ]; then
            source $i
        fi
    done
fi

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

setJavaJDK
