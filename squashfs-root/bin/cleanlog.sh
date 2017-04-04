#!/bin/sh
. /bin/scriptlib.sh
RETRY2G=0
RETRY5G=0
RSSITIMER=0
RSSI5GLAST=200
RSSI2GLAST=200
timeout=0
while [ true ]; do
if [ "`pidof dnrd`" = "" ]; then
dnrd.sh
fi
if [ "`pidof syslogd`" = "" ]; then
syslogd -C
fi
if [ "`pidof reload`" = "" ]; then
reload &
fi
if [ "`pidof webs`" = "" ]; then
webs &
fi
if [ $AP_ROUTER_SWITCH = 1 ]; then
eval `flash get CHANNEL`
eval `flash get WLAN_N_CHAN_WIDTH`
if [ "$AP_MODE" = 6 ]; then
if [ "`cat /proc/wlan0-vxd/sta_info | grep active | cut -b 31`" = 0 ]; then
echo 5 > /proc/ps_led
else
if [ "`cat /proc/wlan0-vxd/sta_info | grep rssi | cut -b 11-12`" -lt 16 ]; then
echo 5 > /proc/ps_led
elif [ "`cat /proc/wlan0-vxd/sta_info | grep rssi | cut -b 11-12`" -lt 32 ]; then
echo 2 > /proc/ps_led
else
if [ "$PPTP_GATEWAY" = "0.0.0.0" ]; then
gateway="`cat /tmp/br0_gw`"
else
gateway=$PPTP_GATEWAY
fi
if [ "$gateway" ] && [ "`fping -I br0 $gateway | grep alive | wc -l`" = 1 ]; then
echo 1 > /proc/ps_led
else
echo 5 > /proc/ps_led
fi
fi
fi
fi
if [ "$AP_MODE" = 6 ]; then
if [ "$PPTP_GATEWAY" = "0.0.0.0" ]; then
GW="`cat /tmp/br0_gw`"
else
GW=$PPTP_GATEWAY
fi
if [ "$GW" = "" ] || [ `fping -I br0 $GW | grep alive | wc -l` != 1 ]; then
RETRY2G=`expr $RETRY2G + 1`
echo 1 > /tmp/connect2g
if [ `expr $RETRY2G % 2` = 1 ]; then
wlan_scan wlan0 scanssid "$STADRV_SSID" $CHANNEL $WLAN_N_CHAN_WIDTH $ROOT_AP_MAC24
fi
if [ "$RETRY2G" =  "6" ]; then
GW=`cat /var/br0_gw`
if [ "$GW" != "" ]; then
dhcpc.sh br0
fi
ifconfig wlan0 down
iwpriv wlan0 set_mib use40M=0
iwpriv wlan0-vxd set_mib use40M=0
brctl addbr br2
brctl setfd br2 0
brctl stp br2 0
brctl delif br0 wlan0
brctl addif br2 wlan0
sleep 8
ifconfig wlan0 up
ifconfig wlan0-vxd down up
ifconfig eth0 down
brctl delif br0 eth0
brctl addif br2 eth0
ifconfig eth0 up
ifconfig br2 192.168.206.1 up
killall udhcpd
dhcpd.sh br2
fi
else
echo 0 > /tmp/connect2g
if [ "$RETRY2G" -ge "6" ]; then
reboot
fi
RETRY2G=0
fi
fi
if [ $RSSITIMER -gt 6 ]; then
if [ "$AP_MODE" = 6 ]; then
RSSI2G=`cat /proc/wlan0-vxd/sta_info | grep rssi | cut -b 11-12`
if [ $RSSI2G ]; then
if [ $RSSI2GLAST = 200 ]; then
RSSI2GLAST=$RSSI2G
fi
if [ `expr $RSSI2GLAST - $RSSI2G` -gt 6 -o `expr $RSSI2G - $RSSI2GLAST` -gt 6  ] ;then
logger "$STADRV_SSID Signal strength change form $RSSI2GLAST to $RSSI2G"
fi
RSSI2GLAST=$RSSI2G
fi
fi
RSSITIMER=0
else
RSSITIMER=`expr $RSSITIMER + 1`
fi
fi
sleep 10
done
