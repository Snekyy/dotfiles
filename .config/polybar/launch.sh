#!/usr/bin/env sh

# Clear previous logs
 > ~/.config/polybar/error.log

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch polybar 
polybar main -c ~/.config/polybar/config.ini --log-level="warning" 2>>$HOME/.config/polybar/error.log 1>&2 &
