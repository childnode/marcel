#/bin/bash
if [ -z "$1" ]; then
    echo "please provide the svn rev" 1>&2
    exit 1;
fi

treeish=$(git svn find-rev r$1)

echo "revert r$1 == $treeish"

git diff $treeish..$treeish^ | patch -p1
