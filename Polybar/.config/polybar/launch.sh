#!/usr/bin/env bash
killall -q polybar
# wait untill process is down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
# Launch bars
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
polybar powermenu -c "$HOME/.config/polybar/config.ini" 2>&1 | tee -a /tmp/polybar1.log & disown
polybar timespace -c "$HOME/.config/polybar/config.ini" 2>&1 | tee -a /tmp/polybar2.log & disown
polybar playerctl -c "$HOME/.config/polybar/config.ini" 2>&1 | tee -a /tmp/polybar2.log & disown
polybar cava -c "$HOME/.config/polybar/config.ini" 2>&1 | tee -a /tmp/polybar2.log & disown
polybar net -c "$HOME/.config/polybar/config.ini" 2>&1 | tee -a /tmp/polybar2.log & disown
polybar -c "$HOME/.config/polybar/config.ini" sysinfo 2>&1 | tee -a /tmp/polybar2.log & disown
