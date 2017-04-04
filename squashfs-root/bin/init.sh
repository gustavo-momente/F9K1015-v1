#!/bin/sh
flash test-hwconf
if [ $? != 0 ]; then
echo 'HW configuration invalid, reset default!'
flash default
fi
flash test-dsconf
if [ $? != 0 ]; then
echo 'Default configuration invalid, reset default!'
flash default
fi
eval `flash get IS_RESET_DEFAULT`
if [ $IS_RESET_DEFAULT = 0 ]; then
eval `flash get HW_WLAN0_REG_DOMAIN`
eval `flash get AP_ROUTER_SWITCH`
if [ $AP_ROUTER_SWITCH = 1 ]; then
eval `flash get HW_BOARD_ID`
if [ $HW_BOARD_ID = 1 ]; then #English
flash set WEB_LANGUAGE 1033
elif [ $HW_BOARD_ID = 2 ]; then #Spanish
flash set WEB_LANGUAGE 3082
elif [ $HW_BOARD_ID = 3 ]; then #German Du
flash set WEB_LANGUAGE 1031
elif [ $HW_BOARD_ID = 4 ]; then #French
flash set WEB_LANGUAGE 1036
elif [ $HW_BOARD_ID = 6 ]; then
flash set WEB_LANGUAGE 1042
elif [ $HW_BOARD_ID = 7 ]; then
flash set WEB_LANGUAGE 1028
elif [ $HW_BOARD_ID = 8 ]; then
flash set WEB_LANGUAGE 2052
elif [ $HW_BOARD_ID = 9 ]; then
flash set WEB_LANGUAGE 1043
elif [ $HW_BOARD_ID = 10 ]; then
flash set WEB_LANGUAGE 1040
else
flash set WEB_LANGUAGE 1033
fi
fi
flash set IS_RESET_DEFAULT 1
fi
rm -rf /tmp/flash.inc
. /bin/scriptlib.sh
rm -rf /var/web
if [ $AP_ROUTER_SWITCH = 1 ]; then
ln -s /web1 /var/web
else
ln -s /web2 /var/web
fi
killall.sh
ifconfig pwlan0 down
ifconfig peth0 down
ifconfig wlan0-vxd down
ifconfig wlan0 down
ifconfig eth1 down
ifconfig eth0 down
ifconfig br0 down
brctl delbr br0
ifconfig br2 down
brctl delbr br2
ifconfig eth0 hw ether $HW_WLAN0_WLAN_ADDR
ifconfig wlan0 hw ether $HW_WLAN0_WLAN_ADDR
wlan2band.sh wlan0
echo 0 > /proc/wps_led
echo 1 > /proc/ps_led
if [ $AP_ROUTER_SWITCH = 1 ]; then
if [ $AP_MODE = 0 ]; then
echo 7 > /proc/ps_led
bridge.sh br0 eth0 wlan0
ifconfig br0 $IP_ADDR netmask $SUBNET_MASK
dhcpd.sh br0
elif [ $AP_MODE = 6 ]; then
wlan2band.sh wlan0-vxd
ifconfig wlan0 down up
bridge.sh br0 eth0 wlan0 wlan0-vxd
fi
echo 1 > /proc/br_dnshijack
syslogd -C
if [ $AP_MODE = 6 ]; then
if [ $PPTP_IP_ADDR = "0.0.0.0" ]; then
dhcpc.sh br0
else
ifconfig br0 $PPTP_IP_ADDR netmask $PPTP_IP_MASK_ADDR
route del default
route add default gw $PPTP_GATEWAY dev br0
echo $PPTP_GATEWAY > /var/br0_gw
if [ $WPS_ENABLE = 1 ]; then wps_init.sh; fi
fi
fi
if [ "`brctl show | grep br0`" ]; then nbnsd -i br0 -n belkin.range; fi &
if [ -f /tmp/connect2g ]; then rm -rf /tmp/connect2g ; fi
if [ $AP_MODE = 0 ]; then
logger "Activate router mode"
else
logger "Deactivate router mode"
fi
fi
echo 1 > /proc/br_igmpsnoop 2>/dev/null
echo 1 > /proc/br_mldsnoop 2>/dev/null
webs &
echo "<meta http-equiv=\"refresh\" content=\"0;url=http://belkin.range\">" > /tmp/index.html
axhttpd -w /tmp	&	#Let DNS hijack work in https
cat /proc/meminfo | grep MemFree
sleep 1
cleanlog.sh &
