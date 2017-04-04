#!/bin/sh
if [ $# -lt 1 ]; then echo "Usage: $0 wlan_interface"; exit; fi
killall udhcpc
. /bin/scriptlib.sh
. /web/FUNCTION_SCRIPT
SET_WLAN="iwpriv $1"
SET_WLAN_PARAM="$SET_WLAN set_mib"
ifconfig $1 down
ifconfig $1 hw ether $HW_WLAN0_WLAN_ADDR
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
$SET_WLAN_PARAM MIMO_TR_mode=3
$SET_WLAN_PARAM macPhyMode=0
$SET_WLAN_PARAM phyBandSelect=1
$SET_WLAN_PARAM band=11
$SET_WLAN_PARAM oprates=4095
$SET_WLAN_PARAM basicrates=15
$SET_WLAN_PARAM use40M=0
$SET_WLAN_PARAM shortGI20M=1
$SET_WLAN_PARAM shortGI40M=1
$SET_WLAN_PARAM ampdu=1
$SET_WLAN_PARAM amsdu=0
if [ $3 != "" ]; then
$SET_WLAN_PARAM channel=$3
iwpriv wlan0 set_mib use40M=0
else
$SET_WLAN_PARAM channel=$CHANNEL
iwpriv wlan0 set_mib use40M=0
fi
if [ "$AP_MODE" = '6' ] && [ "$1" = "wlan0-vxd" ]; then
$SET_WLAN_PARAM opmode=8
$SET_WLAN_PARAM ssid="$STADRV_SSID"
$SET_WLAN_PARAM 802_1x=0
elif [ $3 != "" ]; then
$SET_WLAN_PARAM opmode=8
$SET_WLAN_PARAM ssid="$2"
else
$SET_WLAN_PARAM ssid="$SSID"
fi
$SET_WLAN_PARAM iapp_enable=0
$SET_WLAN_PARAM qos_enable=$WLAN_WMM
if [ "$PROTECTION_DISABLED" = '1' ]; then
$SET_WLAN_PARAM disable_protection=1
else
$SET_WLAN_PARAM disable_protection=0
fi
if [ "$AUTH_TYPE" = '1' ] && [ "$WLAN_ENCRYPT" != '1' ]; then
AUTH_TYPE=0
fi
$SET_WLAN_PARAM authtype=$AUTH_TYPE
if [ "$4" != '' ] && [ "$1" = "wlan0-vxd" ]; then
if [ "$4" = '0' ]; then
$SET_WLAN_PARAM encmode=0
elif [ "$4" = '1' ]; then
len=`echo $5| wc -L`
if [ "$len" = '10' ]; then
$SET_WLAN_PARAM encmode=1
else
$SET_WLAN_PARAM encmode=5
fi
$SET_WLAN_PARAM wepkey1="$5"
$SET_WLAN_PARAM wepdkeyid=0
else
$SET_WLAN_PARAM encmode=2
ENABLE=0
if [ $4 = '2' ]; then
ENABLE=1
CIPHER=2
$SET_WLAN_PARAM wpa_cipher=$CIPHER
$SET_WLAN_PARAM wpa2_cipher=0
elif [ $4 = '3' ]; then
ENABLE=1
CIPHER=8
$SET_WLAN_PARAM wpa_cipher=$CIPHER
$SET_WLAN_PARAM wpa2_cipher=0
elif [ $4 = '4' ]; then
ENABLE=2
CIPHER=2
$SET_WLAN_PARAM wpa_cipher=0
$SET_WLAN_PARAM wpa2_cipher=$CIPHER
elif [ $4 = '5' ]; then
ENABLE=2
CIPHER=8
$SET_WLAN_PARAM wpa_cipher=0
$SET_WLAN_PARAM wpa2_cipher=$CIPHER
fi
$SET_WLAN_PARAM passphrase="$5"
$SET_WLAN_PARAM gk_rekey=0
$SET_WLAN_PARAM psk_enable=$ENABLE
fi
fi
ifconfig $1 up
dhcpc.sh $1
