#!/bin/sh -e

export THEME=default

. $HOME/.local/share/tpl/$THEME
. $HOME/.config/wm/wm.conf

setxkbmap -option compose:ralt
xsetroot -cursor_name left_ptr
xrdb $HOME/.Xresources
bgs -z $HOME/usr/img/bg.jpg

exec bar &
exec sxhkd &
exec wm
