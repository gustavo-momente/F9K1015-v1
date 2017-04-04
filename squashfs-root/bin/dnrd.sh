#!/bin/sh
killall dnrd 2>/dev/null
eval `flash get AP_ROUTER_SWITCH`
eval `flash get OP_MODE`
if [ $AP_ROUTER_SWITCH = 3 ]; then
exit
elif [ $AP_ROUTER_SWITCH = 1 ]; then
dnrd -c off
elif [ $OP_MODE = 0 ]; then
dnrd -c off -m /etc/hosts
elif [ "`flash getWanLink`" != 0 ]; then
dnrd -c off -m /etc/hosts
else
for i in `cat /etc/resolv.conf | cut -d ' ' -f 2`; do cmd="$cmd-s $i "; done
dnrd -c off $cmd -m /etc/hosts
fi
