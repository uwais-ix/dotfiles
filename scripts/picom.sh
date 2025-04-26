#!/bin/bash

killall -q picom
picom -b --config ~/.config/picom/picom.conf
