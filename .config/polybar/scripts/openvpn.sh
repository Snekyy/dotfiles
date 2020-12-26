#!/bin/bash

if [ $(pgrep -x openvpn) ]; then
    if [ "$(ifconfig | grep tun0)" ]; then
	    ip addr show tun0 | awk '/inet / {gsub(/\/.*/,"",$2); print $2}'
    else
    	echo "connecting.."
    fi
else
    echo "disconnected"
fi
