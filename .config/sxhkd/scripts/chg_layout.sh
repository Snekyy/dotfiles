#!/bin/bash

CURRENT_LAYOUT=$(./current_layout.sh)

if [ "$CURRENT_LAYOUT" = "us" ]; then
    setxkbmap "ru"
else
    setxkbmap "us"
fi
