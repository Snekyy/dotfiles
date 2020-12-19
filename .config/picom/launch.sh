#!/usr/bin/env sh

echo > /home/snekyy/.config/picom/error.log
# Terminate already running picom
killall -q picom

# Wait until the processes have been shut down
while pgrep -u $UID -x picom >/dev/null; do sleep 1; done

# Launch picom
picom --experimental-backends -CGb --config /home/snekyy/.config/picom/picom.conf --show-all-xerrors --log-level "WARN" 2>>$HOME/.config/picom/error.log &
