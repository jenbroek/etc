#!/bin/sh -e

if test $# -lt 2; then
	echo "usage: ${0##*/} TARGET_DIR VALUE_FILE..." >&2
	exit 1
fi

target_dir=$1
shift

value_files=
for f in "$@"; do
	value_files="${value_files+$value_files }-f $f"
done

find templates -type f | while read -r p; do
	f=$target_dir/${p#*/}
	mkdir -p "${f%/*}"
	templa $value_files "$p" > "$f"
	chmod $(stat -c %a "$p") "$f"
done
