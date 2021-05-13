#!/usr/bin/env sh

# Clear previous logs
 > /home/snekyy/.config/picom/error.log

# Terminate already running picom
killall -q picom

# Wait until the processes have been shut down
while pgrep -u $UID -x picom >/dev/null; do sleep 1; done

# Launch picom
picom --experimental-backends --config $HOME/.config/picom/picom.conf --log-level "WARN" --show-all-xerrors 2>>$HOME/.config/picom/error.log &
