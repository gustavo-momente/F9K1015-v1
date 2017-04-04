#!/bin/sh
. /tmp/flash_param
eval `flash get WPS_ENABLE`
if [ $WPS_ENABLE = 1 ]; then
eval `flash get WPS_CONFIG_STATUS`
if [ $WPS_CONFIG_STATUS = 1 ]; then exit; fi
flash set SSID "$SSID"
flash set WLAN_ENCRYPT $ENCRYPT
if [ $ENCRYPT = 6 ]; then flash set WLAN_ENCRYPT 7; fi
if [ $ENCRYPT -le 1 ]; then
flash set SECURITY_MODE $ENCRYPT
else
flash set SECURITY_MODE 2
flash set WLAN_PSK_FORMAT $PSK_FORMAT
flash set WLAN_WPA_PSK $WPA_PSK
fi
flash set WPS_CONFIG_STATUS 1
flash set WPS_CONFIG_TYPE 1
else
eval `flash get INIC_WPS_CONFIG_STATUS`
if [ $INIC_WPS_CONFIG_STATUS = 1 ]; then exit; fi
flash set INIC_SSID "$SSID"
flash set INIC_ENCRYPT $ENCRYPT
if [ $ENCRYPT = 6 ]; then flash set INIC_ENCRYPT 7; fi
if [ $ENCRYPT -le 1 ]; then
flash set INIC_SECURITY_MODE $ENCRYPT
else
flash set INIC_SECURITY_MODE 2
flash set INIC_PSK_FORMAT $PSK_FORMAT
flash set INIC_WPA_PSK $WPA_PSK
fi
flash set INIC_WPS_CONFIG_STATUS 1
flash set INIC_WPS_CONFIG_TYPE 1
fi
reboot.sh 2
