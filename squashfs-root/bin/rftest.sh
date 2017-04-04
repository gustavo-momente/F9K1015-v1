#!/bin/sh
readdata() {
echo `flash get HW_BOARD_ID`
echo `flash get HW_WLAN0_WLAN_ADDR`
echo `flash get HW_WLAN0_REG_DOMAIN`
echo `flash get HW_WLAN0_WSC_PIN`
echo `flash get HW_SERIAL_NUMBER`
echo `cat /web/FUNCTION_SCRIPT | grep _MODE_`
echo `cat /web/FUNCTION_SCRIPT | grep _MODEL_`
echo `cat /web/FUNCTION_SCRIPT | grep ^_VERSION_`
echo `flash get HW_NIC1_ADDR`
}
case "$1" in
"WRITEDATA")
if [ "$2" ]; then flash set HW_BOARD_ID $2; fi
if [ "$3" ]; then flash set HW_WLAN0_WLAN_ADDR $3; fi
if [ "$4" ]; then flash set HW_WLAN0_REG_DOMAIN $4; fi
if [ "$7" ]; then flash set HW_WLAN0_WSC_PIN $7; fi
if [ "$8" ]; then flash set HW_SERIAL_NUMBER $8; fi
if [ "$10" ]; then flash set HW_NIC1_ADDR $10; fi
readdata
;;
"READDATA")
readdata
;;
"TESTWPS")
rm -rf /tmp/wps_btn_test
;;
"READWPS")
if [ -f /tmp/wps_btn_test ]; then
echo WPS=1
else
echo WPS=0
fi
;;
*)
$@
;;
esac
