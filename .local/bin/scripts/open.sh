#!/bin/bash
T=`xdg-mime query filetype $1`
echo "opening file "  $1  " of type " $T "with " `xdg-mime query default $T`
nohup xdg-open $1 >/dev/null 2>&1 &
