#!/bin/sh -e

if test $# -lt 2; then
	echo "usage: ${0##*/} TARGET_DIR VALUE_FILE..." >&2
	exit 1
fi

dir=$(readlink -f "$0")
dir=${dir%/*}

target_dir=$1
shift

value_files=
for f in "$@"; do
	value_files="${value_files+$value_files }-f $f"
done

while read -r g; do
	if test -z "$g" || test "$g" = '#'; then
		continue
	fi

	for p in $dir/$g; do
		if test ! -d "$p"; then
			f=$target_dir/${p#$dir/*/}
			mkdir -p "${f%/*}"
			templa $value_files "$p" > "$f"
			chmod $(stat -c %a "$p") "$f"
		fi
	done
done < $dir/.files
