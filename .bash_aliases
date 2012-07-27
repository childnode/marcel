if [ -d ~/.bash_aliases.d ]; then
    for i in ~/.bash_aliases.d/*; do
        . $i
    done
fi
