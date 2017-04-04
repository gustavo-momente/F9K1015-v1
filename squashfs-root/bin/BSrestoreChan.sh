#!/bin/sh
if [ -f /tmp/static_ip_band ] && [ "`cat /tmp/static_ip_band`" = "2" ]; then
echo "2.4GHz use static IP"
else
ifconfig wlan0-vxd 0.0.0.0
fi
CHG=0
if [ `cat /proc/wlan0/mib_all | grep dot11chan | cut -b 19-21` != $1 ]; then
CHG=1
fi
if [ $CHG = 1 ]; then
echo "---> switch channel to $1 for wait DHCP "
iwpriv wlan0 set_mib switch_chan=1,$1
fi
dhcpc.sh wlan0-vxd
sleep 1
if [ $CHG = 1 ]; then
echo "---> restore channel to rootAP for wlan0 from script"
iwpriv wlan0 set_mib switch_chan=0
fi
COUNT=0
while [ `ifconfig wlan0-vxd | grep inet | wc -l` = 0 ] && [ $COUNT -lt 20 ]; do
COUNT=`expr $COUNT + 1`
sleep 1
if [ $CHG = 1 ]; then
echo "---> switch channel to $1 for wait DHCP "
iwpriv wlan0 set_mib switch_chan=1,$1
fi
if [ `expr $COUNT % 10` = 0 ]; then
dhcpc.sh wlan0-vxd
fi
sleep 1
if [ $CHG = 1 ]; then
echo "---> restore channel to rootAP for wlan1 from script"
iwpriv wlan0 set_mib switch_chan=0
fi
done
