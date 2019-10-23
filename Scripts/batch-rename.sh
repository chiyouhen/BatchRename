#! /bin/bash

set -u

if [[ "$#" -ne 1 ]]; then
    echo "only 1 argument required"
    exit 1
fi

base_dir="$1"
if [[ ! -d "$1" ]]; then
    echo "$1 is not a directory"
    exit 2
fi
echo "$base_dir"
ls -1 "$base_dir" | grep -v $(basename $0) | while read -r d; do
    dp="$base_dir/$d"
    if [[ -z "$d" ]]; then
        continue
    fi
    if [[ ! "$d" =~ , ]]; then
        echo "Invalid directory name format '$d', ignore"
        continue
    fi
    if [[ ! -d "$dp" ]]; then
        echo "Not a directory '$d', ignore"
        continue
    fi
        
    loc=${d%,*}
    ts=${d##*, }
    nd="${ts}, ${loc}"
    if [[ ! $nd =~ ^[[:digit:]] ]]; then
        echo "Invalid time format '$ts', ignore"
        continue
    fi
    if [[ -z "$loc" || "$ts" == "$nd" ]]; then
        echo "No location infomation, ignore"
        continue
    fi

    ndp="$base_dir/$nd"
    echo "Attempt to rename '$d' to '$nd'"
    mv "$dp" "$ndp"
done
