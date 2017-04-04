#!/bin/sh
eval `flash get UPNP_ENABLE`
if [ $UPNP_ENABLE = 0 ]; then exit; fi
killall miniigd 2>/dev/null
cp /etc/tmp/* /tmp/linuxigd
route del -net 239.255.255.250 netmask 255.255.255.255 br0
route add -net 239.255.255.250 netmask 255.255.255.255 br0
miniigd -e 0 -i br0
