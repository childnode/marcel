#!/usr/bin/awk -f
BEGIN {
    FS=",";
}

{
    print "|"$1"|"$2"|"$3"|"$4"|"$5"|"$6"|"$7"|"$8"|"$9"|"$10
}
