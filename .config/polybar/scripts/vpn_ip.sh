#!/bin/bash

# Print tun0 ip
# if tun0 not found but procces openvpn exists
# print "connecting.."
# this meens user entering login/password for vpn connection
# or he is connecting to vpn server
if [ "$(ifconfig | grep tun0)" ]; then
	ip addr show tun0 | awk '/inet / {gsub(/\/.*/,"",$2); print $2}'
else
	echo "connecting.."
fi

