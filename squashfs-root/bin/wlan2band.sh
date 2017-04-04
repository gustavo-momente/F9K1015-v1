#!/bin/sh
. /bin/scriptlib.sh
. /web/FUNCTION_SCRIPT
SET_WLAN="iwpriv $1"
SET_WLAN_PARAM="$SET_WLAN set_mib"
ifconfig $1 down
if [ "$WLAN_DISABLED" = 1 ]; then
echo "WLAN not ENABLE"
exit 0
fi
if [ "$1" = "wlan0-va0" ]; then
ifconfig $1 hw ether $HW_WLAN0_WLAN_ADDR2
else
ifconfig $1 hw ether $HW_WLAN0_WLAN_ADDR
fi
$SET_WLAN_PARAM regdomain=$HW_WLAN0_REG_DOMAIN
$SET_WLAN_PARAM led_type=$HW_WLAN0_LED_TYPE
$SET_WLAN_PARAM opmode=16
$SET_WLAN_PARAM pwrlevelCCK_A=$HW_WLAN0_TX_POWER_CCK_A
$SET_WLAN_PARAM pwrlevelCCK_B=$HW_WLAN0_TX_POWER_CCK_B
$SET_WLAN_PARAM pwrlevelHT40_1S_A=$HW_WLAN0_TX_POWER_HT40_1S_A
$SET_WLAN_PARAM pwrlevelHT40_1S_B=$HW_WLAN0_TX_POWER_HT40_1S_B
$SET_WLAN_PARAM pwrdiffHT40_2S=$HW_WLAN0_TX_POWER_DIFF_HT40_2S
$SET_WLAN_PARAM pwrdiffHT20=$HW_WLAN0_TX_POWER_DIFF_HT20
$SET_WLAN_PARAM pwrdiffOFDM=$HW_WLAN0_TX_POWER_DIFF_OFDM
$SET_WLAN_PARAM tssi1=$HW_WLAN0_11N_TSSI1
$SET_WLAN_PARAM tssi2=$HW_WLAN0_11N_TSSI2
$SET_WLAN_PARAM ther=$HW_WLAN0_11N_THER
$SET_WLAN_PARAM bcnint=$BEACON_INTERVAL
$SET_WLAN_PARAM rtsthres=$RTS_THRESHOLD
$SET_WLAN_PARAM fragthres=$FRAG_THRESHOLD
$SET_WLAN_PARAM expired_time=$INACTIVITY_TIME
$SET_WLAN_PARAM preamble=$PREAMBLE_TYPE
$SET_WLAN_PARAM 802_1x=$WLAN_ENABLE_1X
$SET_WLAN_PARAM block_relay=$WLAN_BLOCK_RELAY
$SET_WLAN_PARAM hiddenAP=$HIDDEN_SSID
$SET_WLAN_PARAM MIMO_TR_mode=3
$SET_WLAN_PARAM macPhyMode=0
$SET_WLAN_PARAM phyBandSelect=1
if [ $AP_ROUTER_SWITCH = 1 ]; then
if [ $BAND = 1 ]; then	#b
$SET_WLAN_PARAM band=1
elif [ $BAND = 2 ]; then	#n
$SET_WLAN_PARAM band=8
elif [ $BAND = 3 ]; then	#bg
$SET_WLAN_PARAM band=3
elif [ $BAND = 4 ]; then	#g
$SET_WLAN_PARAM band=2
elif [ $BAND = 5 ]; then	#bgn
$SET_WLAN_PARAM band=11
else
$SET_WLAN_PARAM band=11
fi
else
if [ $BAND = 1 ]; then
$SET_WLAN_PARAM band=2
elif [ $BAND = 2 ]; then
$SET_WLAN_PARAM band=8
elif [ $BAND = 3 ]; then
$SET_WLAN_PARAM band=11
fi
fi
$SET_WLAN_PARAM oprates=4095
$SET_WLAN_PARAM basicrates=15
if [ $WLAN_N_CHAN_WIDTH = 0 ]; then
$SET_WLAN_PARAM use40M=0
else
$SET_WLAN_PARAM use40M=1
$SET_WLAN_PARAM 2ndchoffset=$WLAN_N_CHAN_WIDTH
fi
$SET_WLAN_PARAM shortGI20M=1
$SET_WLAN_PARAM shortGI40M=1
$SET_WLAN_PARAM ampdu=1
$SET_WLAN_PARAM amsdu=0
$SET_WLAN_PARAM channel=$CHANNEL
if [ "$AP_MODE" = 6 ] && [ "$1" = "wlan0-vxd" ]; then
$SET_WLAN_PARAM opmode=8
$SET_WLAN_PARAM ssid="$STADRV_SSID"
$SET_WLAN_PARAM 802_1x=0
else
$SET_WLAN_PARAM ssid="$SSID"
fi
$SET_WLAN_PARAM iapp_enable=0
$SET_WLAN_PARAM qos_enable=$WLAN_WMM
if [ "$PROTECTION_DISABLED" = 1 ]; then
$SET_WLAN_PARAM disable_protection=1
else
$SET_WLAN_PARAM disable_protection=0
fi
if [ "$AUTH_TYPE" = 1 ] && [ "$WLAN_ENCRYPT" != 1 ]; then
AUTH_TYPE=0
fi
$SET_WLAN_PARAM authtype=$AUTH_TYPE
if [ "$AP_MODE" = 6 ] && [ "$1" = "wlan0-vxd" ]; then
if [ $STADRV_ENCRYPT_TYPE = 0 ]; then
$SET_WLAN_PARAM encmode=0
elif [ $STADRV_ENCRYPT_TYPE = 1 ]; then
len=`echo $STADRV_WEPKEY1 | wc -L`
if [ "$len" = '10' ]; then
$SET_WLAN_PARAM encmode=1
else
$SET_WLAN_PARAM encmode=5
fi
$SET_WLAN_PARAM wepkey1=$STADRV_WEPKEY1
$SET_WLAN_PARAM wepkey2=$STADRV_WEPKEY2
$SET_WLAN_PARAM wepkey3=$STADRV_WEPKEY3
$SET_WLAN_PARAM wepkey4=$STADRV_WEPKEY4
$SET_WLAN_PARAM wepdkeyid=$STADRV_WEP_DEFAULT_KEY
else
$SET_WLAN_PARAM encmode=2
ENABLE=0
if [ $STADRV_ENCRYPT_TYPE = 2 ]; then
if [ $STADRV_WPA_CIPHER = 0 ]; then
ENABLE=1
CIPHER=2
$SET_WLAN_PARAM wpa_cipher=$CIPHER
$SET_WLAN_PARAM wpa2_cipher=0
elif [ $STADRV_WPA_CIPHER = 1 ]; then
ENABLE=1
CIPHER=8
$SET_WLAN_PARAM wpa_cipher=$CIPHER
$SET_WLAN_PARAM wpa2_cipher=0
elif [ $STADRV_WPA_CIPHER = 2 ]; then
ENABLE=2
CIPHER=2
$SET_WLAN_PARAM wpa_cipher=0
$SET_WLAN_PARAM wpa2_cipher=$CIPHER
else
ENABLE=2
CIPHER=8
$SET_WLAN_PARAM wpa_cipher=0
$SET_WLAN_PARAM wpa2_cipher=$CIPHER
fi
fi
$SET_WLAN_PARAM passphrase="$STADRV_PSKKEY"
$SET_WLAN_PARAM gk_rekey=$WLAN_WPA_GROUP_REKEY_TIME
$SET_WLAN_PARAM psk_enable=$ENABLE
fi
else
if [ "$WLAN_ENCRYPT" = 0 ]; then
$SET_WLAN_PARAM encmode=0
elif [ "$WLAN_ENCRYPT" = 1 ]; then
if [ "$WEP" = 1 ]; then
$SET_WLAN_PARAM encmode=1
$SET_WLAN_PARAM wepkey1=$WEP64_KEY1
$SET_WLAN_PARAM wepkey2=$WEP64_KEY2
$SET_WLAN_PARAM wepkey3=$WEP64_KEY3
$SET_WLAN_PARAM wepkey4=$WEP64_KEY4
$SET_WLAN_PARAM wepdkeyid=$WEP_DEFAULT_KEY
else
$SET_WLAN_PARAM encmode=5
$SET_WLAN_PARAM wepkey1=$WEP128_KEY1
$SET_WLAN_PARAM wepkey2=$WEP128_KEY2
$SET_WLAN_PARAM wepkey3=$WEP128_KEY3
$SET_WLAN_PARAM wepkey4=$WEP128_KEY4
$SET_WLAN_PARAM wepdkeyid=$WEP_DEFAULT_KEY
fi
else
$SET_WLAN_PARAM encmode=2
ENABLE=0
if [ $WLAN_ENCRYPT = 7 ]; then
ENABLE=3
$SET_WLAN_PARAM wpa_cipher=2
$SET_WLAN_PARAM wpa2_cipher=8
elif [ $STADRV_ENCRYPT_TYPE = 2 ]; then
if [ $STADRV_WPA_CIPHER = 0 ]; then
ENABLE=1
CIPHER=2
$SET_WLAN_PARAM wpa_cipher=$CIPHER
$SET_WLAN_PARAM wpa2_cipher=0
elif [ $STADRV_WPA_CIPHER = 1 ]; then
ENABLE=1
CIPHER=8
$SET_WLAN_PARAM wpa_cipher=$CIPHER
$SET_WLAN_PARAM wpa2_cipher=0
elif [ $STADRV_WPA_CIPHER = 2 ]; then
ENABLE=2
CIPHER=2
$SET_WLAN_PARAM wpa_cipher=0
$SET_WLAN_PARAM wpa2_cipher=$CIPHER
else
ENABLE=2
CIPHER=8
$SET_WLAN_PARAM wpa_cipher=0
$SET_WLAN_PARAM wpa2_cipher=$CIPHER
fi
else # router mode
if [ $WLAN_WPA_CIPHER_SUITE = 0 ]; then
ENABLE=1
CIPHER=2
$SET_WLAN_PARAM wpa_cipher=$CIPHER
$SET_WLAN_PARAM wpa2_cipher=0
elif [ $WLAN_WPA_CIPHER_SUITE = 1 ]; then
ENABLE=1
CIPHER=8
$SET_WLAN_PARAM wpa_cipher=$CIPHER
$SET_WLAN_PARAM wpa2_cipher=0
elif [ $WLAN_WPA_CIPHER_SUITE = 2 ]; then
ENABLE=2
CIPHER=2
$SET_WLAN_PARAM wpa_cipher=0
$SET_WLAN_PARAM wpa2_cipher=$CIPHER
elif [ $WLAN_WPA_CIPHER_SUITE = 3 ]; then
ENABLE=2
CIPHER=8
$SET_WLAN_PARAM wpa_cipher=0
$SET_WLAN_PARAM wpa2_cipher=$CIPHER
else #mix mode open all
ENABLE=3
$SET_WLAN_PARAM wpa_cipher=10
$SET_WLAN_PARAM wpa2_cipher=10
fi
fi
$SET_WLAN_PARAM passphrase="$WLAN_WPA_PSK"
$SET_WLAN_PARAM gk_rekey=$WLAN_WPA_GROUP_REKEY_TIME
$SET_WLAN_PARAM psk_enable=$ENABLE
fi
fi
$SET_WLAN_PARAM vap_enable=0
if [ $HW_WLAN0_REG_DOMAIN = 3 -o $HW_WLAN0_REG_DOMAIN = 4 -o $HW_WLAN0_REG_DOMAIN = 5 ]; then
$SET_WLAN_PARAM adaptivity_enable=1
fi
set_PWRTBL.sh $1 $WLAN_N_CHAN_WIDTH
if [ $FIREWALL_ENABLE = 1 ]; then
if [ $MACFILTER_ENABLED = 1 ] && [ $MACFILTER_TBL_NUM -gt 0 ]; then
$SET_WLAN_PARAM aclnum=0
$SET_WLAN_PARAM aclmode=1
num=1
while [ $num -le $MACFILTER_TBL_NUM ]; do
eval "macfilter=\$MACFILTER_TBL$num"
$SET_WLAN_PARAM acladdr=`echo $macfilter | tr -d :`
num=`expr $num + 1`
done
fi
fi
ifconfig $1 up
if [ $AP_ROUTER_SWITCH = 1 ] && [ $1 = "wlan0" ]; then
if [ $AP_MODE = 0 ]; then
wlan_scan wlan0 maxRssi
else
sleep 1
wlan_scan wlan0 scanssid "$STADRV_SSID" $CHANNEL $WLAN_N_CHAN_WIDTH
fi
fi
