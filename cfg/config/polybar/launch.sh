#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Clear previous logs
 > ~/.config/polybar/polybar.log

# Launch polybar 
polybar main -c ~/.config/polybar/config.ini --log-level="warning" 2>>$HOME/.config/polybar/polybar.log 1>&2 &
