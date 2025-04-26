#!/bin/bash

CONFIG_DIR=~/.config/sxhkd
I3_SERVICE=sxhkd-i3

inotifywait -m -e modify,create,delete,move $CONFIG_DIR | while read -r path _ file; do
  echo "sxhkd config change detected: $file"
  systemctl --user restart $I3_SERVICE
done
