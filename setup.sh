#!/bin/sh -e

while test -z "$THEME"; do
    printf 'Specify theme: '
    read -r THEME
done

export THEME

dir=$(readlink -f "$0")
dir=${dir%/*}

. $dir/share/.local/share/tpl/$THEME
. $dir/config/.config/wm/wm.conf

while read -r g d; do
    for p in $dir/$g; do
        if test ! -d "$p"; then
            f=${d:-${dir%/*}}/${p#$dir/*/}
            mkdir -p "${f%/*}"
            tpl "$p" > "$f"
            chmod $(stat -c %a "$p") "$f"
        fi
    done
done < $dir/.files
