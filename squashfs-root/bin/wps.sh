#!/bin/sh
WAIT_TIME=10
while [ $WAIT_TIME -gt 0 ]
do
if [ "`pidof wscd`" = "" ] || [ -f /tmp/wps_btn ]; then
echo "Wait to wps_init.sh initialize..."
sleep 1
WAIT_TIME=`expr $WAIT_TIME - 1`
else
break
fi	
done
if [ $WAIT_TIME = 0 ]; then
echo "Waitting time for wps_init.sh is too long, exit wps.sh!"
exit 0
fi
eval `flash get WPS_ENABLE`
eval `flash get INIC_WPS_ENABLE`
if [ $WPS_ENABLE = 1 ]; then
wlan=wlan0
else
exit
fi
echo 1 > /tmp/wps_btn
echo 4 > /proc/wps_led
if [ "$1" ]; then
iwpriv $wlan set_mib pin=$1
logger "wps pin start"
else
wscd -sig_pbc $wlan
logger "wps pbc start"
fi
wscd_status=0
time_out=0
while [ $wscd_status != 1 ] && [ $wscd_status != 3 ] && [ $wscd_status != 33 ] && [ $time_out -lt 120 ]; do
sleep 2
wscd_status=`cat /tmp/wscd_status`
time_out=`expr $time_out + 2`
if [ $time_out = 30 ]; then
rm -rf /tmp/wps_btn
fi
done
if [ $wscd_status = 3 ]; then
echo 1 > /proc/wps_led
if [ "$1" ]; then
logger "wps pin success"
else
logger "wps pbc success"
fi
if [ $WPS_ENABLE = 1 ]; then
eval `flash get WPS_CONFIG_STATUS`
if [ $WPS_CONFIG_STATUS = 0 ]; then
wps_set.sh
fi
else
eval `flash get INIC_WPS_CONFIG_STATUS`
if [ $INIC_WPS_CONFIG_STATUS = 0 ]; then
wps_set.sh
fi
fi
sleep 5
elif [ $wscd_status = 1 ] || [ $wscd_status = 33 ]; then
logger "wps overlap"
echo 5 > /proc/wps_led
sleep 60
else
logger "wps time out"
echo 5 > /proc/wps_led
sleep 60
fi
echo 0 > /proc/wps_led
wps_init.sh
