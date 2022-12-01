#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use
# polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

# Launch bar1 and bar2
# echo "---" | tee -a /tmp/polybar1.log
# polybar mainbar 2>&1 | tee -a /tmp/polybar1.log &
# disown

# echo "Polybar launched..."

#First we allow ourselves to run herbstclient as hc
hc() { "${herbstclient_command[@]:-herbstclient}" "$@"; }
#Next I am saying that $monitor represents all my monitors
monitor=${1:-0}
# Terminate already running bar instances
killall -q polybar
# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
# Launch bars
# polybar top &
(
    sleep 2
    polybar --config=$HOME/.config/polybar/config.ini mainbar
) &

echo "Bars launched..."
#this line of code will pad EACH monitor 32 pixels
hc pad "$monitor" 32 0 0 0
#this line of code will pad monitor 0 32 pixels
#hc pad 0 32 0 0 0
