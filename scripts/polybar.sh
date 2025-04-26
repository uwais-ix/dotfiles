#!/bin/bash

hwmon=$(find /sys/devices/platform/coretemp.0/hwmon/ -name 'temp1_input' | head -n 1)
echo $hwmon


start(){
  polybar-msg cmd quit

  HWMON_PATH="$hwmon" polybar $1 -r 2>&1 | tee -a /tmp/polybar.log & disown
}

case $1 in
  i3) start i3
  ;;
  *) echo error
  ;;
esac

