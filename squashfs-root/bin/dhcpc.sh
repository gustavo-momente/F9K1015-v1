#!/bin/sh
if [ -f /tmp/udhcpc-$1.pid ]; then
kill -9 `cat /tmp/udhcpc-$1.pid`
rm -rf /tmp/udhcpc-$1.pid
if [ -f /tmp/static_ip_band ]; then
rm -f /tmp/static_ip_band
else
ifconfig $1 0.0.0.0
fi
fi
eval `flash get DYNIP_HOSTNAME`
if [ "$DYNIP_HOSTNAME" ]; then
udhcpc -a -h "$DYNIP_HOSTNAME" -i $1 -p /tmp/udhcpc-$1.pid -s /etc/udhcpc/$1.sh &
else
udhcpc -a -h Belkin\ Client -i $1 -p /tmp/udhcpc-$1.pid -s /etc/udhcpc/$1.sh &
fi
sleep 1
