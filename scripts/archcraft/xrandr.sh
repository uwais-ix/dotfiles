#!/usr/bin/env bash
#
#
disp_int=eDP-1-1
disp_g27=DP-1-1
# disp_g24=HDMI-0
disp_g24=DP-1-1

main=$disp_g27
sec=$disp_g24
int=$disp_int

# xrandr --output $main --mode 2560x1440 --rate 164.80 --output $int --off --output $sec --mode 1920x1080 --rate 165.00 --above $main
# xrandr --output $main --mode 2560x1440 --rate 164.80 --output $int --mode 2560x1600 --rate 240 --left-of $main --output $sec --mode 1920x1080 --rate 165.00 --above $main
xrandr --output $main --mode 2560x1440 --rate 164.80 --output $int --mode 2560x1600 --rate 240 --left-of $main
