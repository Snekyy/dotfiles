#!/usr/bin/env bash

get_total_updates() {
echo $(checkupdates 2>/dev/null | wc -l);
}

while true; do
    get_total_updates
	sleep 30
done
