#!/bin/bash

# set up a horizontal monitor with a vertical monitor on the left
vert_monitor=$(xrandr --query | grep 'HDMI-0')
horiz_monitor=$(xrandr --query | grep 'DP-1')

if [[ $vert_monitor = *connected* && $horiz_monitor = *connected* ]]; then
	xrandr --output DP-1 --primary --mode 2560x1440 --rotate normal --right-of HDMI-0
	xrandr --output HDMI-0 --mode 2560x1440 --rotate left
fi
