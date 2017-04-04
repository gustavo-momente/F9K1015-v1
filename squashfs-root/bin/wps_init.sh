#!/bin/sh
echo 1 > /tmp/wps_btn
echo 0 > /proc/wps_led
if [ "`pidof wps.sh`" ]; then
killall wps.sh
> /tmp/wscd_cancel
sleep 1
fi
eval `flash get WPS_ENABLE`
eval `flash get INIC_WPS_ENABLE`
eval `flash get CROSS_BAND`
eval `flash get CROSS_BAND_SUPPORT`
if [ $WPS_ENABLE = 1 ]; then
eval `flash get AP_ROUTER_SWITCH`
wlan=wlan0
br=br0
eval `flash get WPS_CONFIG_STATUS`
config=$WPS_CONFIG_STATUS
eval `flash get WLAN_ENCRYPT`
if [ $config = 1 ] && [ $WLAN_ENCRYPT = 1 ]; then exit; fi
eval `flash get STADRV_ENCRYPT_TYPE`
eval `flash get STADRV_WPA_CIPHER`
if [ $config = 1 ] && [ $WLAN_ENCRYPT -gt 1 ] && [ $STADRV_ENCRYPT_TYPE = 2 ] && [ $STADRV_WPA_CIPHER -lt 3 ]; then exit; fi
else
exit
fi
killall wscd iapp iwcontrol 2>/dev/null
rm -rf /var/wps
mkdir /var/wps
cp /etc/simplecfg*.xml /var/wps
route del -net 239.255.255.250 netmask 255.255.255.255 $br
route add -net 239.255.255.250 netmask 255.255.255.255 $br
flash upd-wsc-conf /etc/wscd.conf /var/wsc-$wlan.conf $wlan
killall wscd iapp iwcontrol 2>/dev/null
wscd -start -c /var/wsc-$wlan.conf -br $br -w $wlan -fi /var/wscd-$wlan.fifo -daemon
sleep 1
iapp $br $wlan
iwcontrol $wlan
sleep 1
rm -rf /tmp/wps_btn
