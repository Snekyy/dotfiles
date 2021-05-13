#!/usr/bin/env bash

get_total_updates() { UPDATES=$(checkupdates 2>/dev/null | wc -l); }

while true; do
    echo "$UPDATES"
    sleep 30
    get_total_updates
done
