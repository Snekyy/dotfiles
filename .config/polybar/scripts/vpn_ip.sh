#!/bin/bash

if [ "$(ifconfig | grep tun0)" ]; then
	ip addr show tun0 | awk '/inet / {gsub(/\/.*/,"",$2); print $2}'
else
	echo "connecting.."
fi

