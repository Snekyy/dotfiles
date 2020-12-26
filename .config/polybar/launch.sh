#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
# Launch bar1 and bar2

polybar left1 -c ~/.config/polybar/config.ini --log-level="warning" 2>>$HOME/.config/polybar/error.log 1>&2 &
polybar left2 -c ~/.config/polybar/config.ini --log-level="warning" 2>>$HOME/.config/polybar/error.log 1>&2 &
polybar center -c ~/.config/polybar/config.ini --log-level="warning" 2>>$HOME/.config/polybar/error.log 1>&2 &
polybar right1 -c ~/.config/polybar/config.ini --log-level="warning" 2>>$HOME/.config/polybar/error.log 1>&2 &
polybar right2 -c ~/.config/polybar/config.ini --log-level="warning" 2>>$HOME/.config/polybar/error.log 1>&2 &
polybar right3 -c ~/.config/polybar/config.ini --log-level="warning" 2>>$HOME/.config/polybar/error.log 1>&2 &
