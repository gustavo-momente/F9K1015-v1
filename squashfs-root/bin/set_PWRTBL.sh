#!/bin/sh
if [ $1 = "wlan0" ]; then
eval `flash get HW_WLAN0_11N_RESERVED5`
eval `flash get HW_WLAN0_11N_RESERVED6`
eval `flash get HW_WLAN0_11N_RESERVED7`
eval `flash get HW_WLAN0_11N_RESERVED8`
eval `flash get HW_WLAN0_REG_DOMAIN`
B_BAND=$HW_WLAN0_11N_RESERVED5
G_BAND=$HW_WLAN0_11N_RESERVED6
N_BAND_20M=$HW_WLAN0_11N_RESERVED7
N_BAND_40M=$HW_WLAN0_11N_RESERVED8
REG_DOMAIN=$HW_WLAN0_REG_DOMAIN
SET_INIC_PARAM="iwpriv $1 set_mib"
else
exit 1
fi
if [ $REG_DOMAIN = '3' ]; then #EUR
if [ $B_BAND -ge 16 ]; then
B_BAND=`hex_dec_convert dec2hex $B_BAND | cut -c 2`
else
B_BAND=`hex_dec_convert dec2hex $B_BAND | cut -c 1`
fi
if [ $G_BAND -ge 16 ]; then
G_BAND=`hex_dec_convert dec2hex $G_BAND | cut -c 2`
else
G_BAND=`hex_dec_convert dec2hex $G_BAND | cut -c 1`
fi
if [ $N_BAND_20M -ge 16 ]; then
N_BAND_20M=`hex_dec_convert dec2hex $N_BAND_20M | cut -c 2`
else
N_BAND_20M=`hex_dec_convert dec2hex $N_BAND_20M | cut -c 1`
fi
if [ $N_BAND_40M -ge 16 ]; then
N_BAND_40M=`hex_dec_convert dec2hex $N_BAND_40M | cut -c 2`
else
N_BAND_40M=`hex_dec_convert dec2hex $N_BAND_40M | cut -c 1`
fi
else #USA
if [ $B_BAND -ge 16 ]; then
B_BAND=`hex_dec_convert dec2hex $B_BAND | cut -c 1`
else
B_BAND=0
fi
if [ $G_BAND -ge 16 ]; then
G_BAND=`hex_dec_convert dec2hex $G_BAND | cut -c 1`
else
G_BAND=0
fi
if [ $N_BAND_20M -ge 16 ]; then
N_BAND_20M=`hex_dec_convert dec2hex $N_BAND_20M | cut -c 1`
else
N_BAND_20M=0
fi
if [ $N_BAND_40M -ge 16 ]; then
N_BAND_40M=`hex_dec_convert dec2hex $N_BAND_40M | cut -c 1`
else
N_BAND_40M=0
fi
fi
Value11b=`hex_dec_convert hex2dec $B_BAND`
Value11g=`hex_dec_convert hex2dec $G_BAND`
Value11n20M=`hex_dec_convert hex2dec $N_BAND_20M`
Value11n40M=`hex_dec_convert hex2dec $N_BAND_40M`
$SET_INIC_PARAM txPowerPlus_cck_1=$Value11b
$SET_INIC_PARAM txPowerPlus_cck_2=`expr $Value11b \* 2 / 3  `
$SET_INIC_PARAM txPowerPlus_cck_5=`expr $Value11b \* 1 / 3 `
$SET_INIC_PARAM txPowerPlus_cck_11=0
$SET_INIC_PARAM txPowerPlus_ofdm_6=$Value11g
$SET_INIC_PARAM txPowerPlus_ofdm_9=`expr $Value11g \* 6 / 7`
$SET_INIC_PARAM txPowerPlus_ofdm_12=`expr $Value11g \* 5 / 7`
$SET_INIC_PARAM txPowerPlus_ofdm_18=`expr $Value11g \* 4 / 7`
$SET_INIC_PARAM txPowerPlus_ofdm_24=`expr $Value11g \* 3 / 7`
$SET_INIC_PARAM txPowerPlus_ofdm_36=`expr $Value11g \* 2 / 7`
$SET_INIC_PARAM txPowerPlus_ofdm_48=`expr $Value11g \* 1 / 7`
$SET_INIC_PARAM txPowerPlus_ofdm_54=0
if [ "$2" = "2" ]; then  #20M
$SET_INIC_PARAM txPowerPlus_mcs_0=$Value11n20M
$SET_INIC_PARAM txPowerPlus_mcs_1=`expr $Value11n20M \* 6 / 7`
$SET_INIC_PARAM txPowerPlus_mcs_2=`expr $Value11n20M \* 5 / 7`
$SET_INIC_PARAM txPowerPlus_mcs_3=`expr $Value11n20M \* 4 / 7`
$SET_INIC_PARAM txPowerPlus_mcs_4=`expr $Value11n20M \* 3 / 7`
$SET_INIC_PARAM txPowerPlus_mcs_5=`expr $Value11n20M \* 2 / 7`
$SET_INIC_PARAM txPowerPlus_mcs_6=`expr $Value11n20M \* 1 / 7`
$SET_INIC_PARAM txPowerPlus_mcs_7=0
$SET_INIC_PARAM txPowerPlus_mcs_8=$Value11n20M
$SET_INIC_PARAM txPowerPlus_mcs_9=`expr $Value11n20M \* 6 / 7`
$SET_INIC_PARAM txPowerPlus_mcs_10=`expr $Value11n20M \* 5 / 7`
$SET_INIC_PARAM txPowerPlus_mcs_11=`expr $Value11n20M \* 4 / 7`
$SET_INIC_PARAM txPowerPlus_mcs_12=`expr $Value11n20M \* 3 / 7`
$SET_INIC_PARAM txPowerPlus_mcs_13=`expr $Value11n20M \* 2 / 7`
$SET_INIC_PARAM txPowerPlus_mcs_14=`expr $Value11n20M \* 1 / 7`
$SET_INIC_PARAM txPowerPlus_mcs_15=0
else #40M
$SET_INIC_PARAM txPowerPlus_mcs_0=$Value11n40M
$SET_INIC_PARAM txPowerPlus_mcs_1=`expr $Value11n40M \* 6 / 7`
$SET_INIC_PARAM txPowerPlus_mcs_2=`expr $Value11n40M \* 5 / 7`
$SET_INIC_PARAM txPowerPlus_mcs_3=`expr $Value11n40M \* 4 / 7`
$SET_INIC_PARAM txPowerPlus_mcs_4=`expr $Value11n40M \* 3 / 7`
$SET_INIC_PARAM txPowerPlus_mcs_5=`expr $Value11n40M \* 2 / 7`
$SET_INIC_PARAM txPowerPlus_mcs_6=`expr $Value11n40M \* 1 / 7`
$SET_INIC_PARAM txPowerPlus_mcs_7=0
$SET_INIC_PARAM txPowerPlus_mcs_8=$Value11n40M
$SET_INIC_PARAM txPowerPlus_mcs_9=`expr $Value11n40M \* 6 / 7`
$SET_INIC_PARAM txPowerPlus_mcs_10=`expr $Value11n40M \* 5 / 7`
$SET_INIC_PARAM txPowerPlus_mcs_11=`expr $Value11n40M \* 4 / 7`
$SET_INIC_PARAM txPowerPlus_mcs_12=`expr $Value11n40M \* 3 / 7`
$SET_INIC_PARAM txPowerPlus_mcs_13=`expr $Value11n40M \* 2 / 7`
$SET_INIC_PARAM txPowerPlus_mcs_14=`expr $Value11n40M \* 1 / 7`
$SET_INIC_PARAM txPowerPlus_mcs_15=0
fi
if [ 1 = 0 ]; then
$SET_INIC_PARAM txPowerPlus_cck_1=0
$SET_INIC_PARAM txPowerPlus_cck_2=0
$SET_INIC_PARAM txPowerPlus_cck_5=0
$SET_INIC_PARAM txPowerPlus_cck_11=0
$SET_INIC_PARAM txPowerPlus_ofdm_6=8
$SET_INIC_PARAM txPowerPlus_ofdm_9=7
$SET_INIC_PARAM txPowerPlus_ofdm_12=6
$SET_INIC_PARAM txPowerPlus_ofdm_18=5
$SET_INIC_PARAM txPowerPlus_ofdm_24=4
$SET_INIC_PARAM txPowerPlus_ofdm_36=3
$SET_INIC_PARAM txPowerPlus_ofdm_48=1
$SET_INIC_PARAM txPowerPlus_ofdm_54=0
if [ $2 = 0 ]; then
$SET_INIC_PARAM txPowerPlus_mcs_0=9
$SET_INIC_PARAM txPowerPlus_mcs_1=8
$SET_INIC_PARAM txPowerPlus_mcs_2=7
$SET_INIC_PARAM txPowerPlus_mcs_3=6
$SET_INIC_PARAM txPowerPlus_mcs_4=5
$SET_INIC_PARAM txPowerPlus_mcs_5=3
$SET_INIC_PARAM txPowerPlus_mcs_6=1
$SET_INIC_PARAM txPowerPlus_mcs_7=0
$SET_INIC_PARAM txPowerPlus_mcs_8=9
$SET_INIC_PARAM txPowerPlus_mcs_9=8
$SET_INIC_PARAM txPowerPlus_mcs_10=7
$SET_INIC_PARAM txPowerPlus_mcs_11=6
$SET_INIC_PARAM txPowerPlus_mcs_12=5
$SET_INIC_PARAM txPowerPlus_mcs_13=3
$SET_INIC_PARAM txPowerPlus_mcs_14=1
$SET_INIC_PARAM txPowerPlus_mcs_15=0
else
$SET_INIC_PARAM txPowerPlus_mcs_0=5
$SET_INIC_PARAM txPowerPlus_mcs_1=4
$SET_INIC_PARAM txPowerPlus_mcs_2=4
$SET_INIC_PARAM txPowerPlus_mcs_3=3
$SET_INIC_PARAM txPowerPlus_mcs_4=3
$SET_INIC_PARAM txPowerPlus_mcs_5=2
$SET_INIC_PARAM txPowerPlus_mcs_6=1
$SET_INIC_PARAM txPowerPlus_mcs_7=0
$SET_INIC_PARAM txPowerPlus_mcs_8=5
$SET_INIC_PARAM txPowerPlus_mcs_9=4
$SET_INIC_PARAM txPowerPlus_mcs_10=4
$SET_INIC_PARAM txPowerPlus_mcs_11=3
$SET_INIC_PARAM txPowerPlus_mcs_12=3
$SET_INIC_PARAM txPowerPlus_mcs_13=2
$SET_INIC_PARAM txPowerPlus_mcs_14=1
$SET_INIC_PARAM txPowerPlus_mcs_15=0
fi
fi
