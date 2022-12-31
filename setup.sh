#!/bin/sh -e

dir=$(readlink -f "$0")
dir=${dir%/*}

while read -r g; do
    for p in $dir/$g; do
        if test ! -d "$p"; then
            f=${dir%/*}/${p#$dir/*/}
            mkdir -p "${f%/*}"
            tpl "$p" > "$f"
            chmod $(stat -c %a "$p") "$f"
        fi
    done
done < $dir/.files
