#!/bin/bash

NODES_HIDDEN=$(bspc query -N -n .hidden)
NODES=$(bspc query -N -n .tiled -d focused)

if [ $(echo $NODES_HIDDEN | wc -w) -eq 0 ]; then
    for node in $NODES; do
        bspc node $node -g hidden=on
    done
else
    for node in $NODES_HIDDEN; do
        bspc node $node -g hidden=off
    done
fi
