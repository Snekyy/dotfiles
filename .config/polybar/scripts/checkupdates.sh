#!/usr/bin/env bash

get_total_updates() { UPDATES=$(checkupdates 2>/dev/null | wc -l); }

while true; do
    get_total_updates
    # when there are updates available
    # every 10 seconds another check for updates is done
    while (( UPDATES > 0 )); do
        echo "$UPDATES"
        sleep 10
        get_total_updates
    done
done
