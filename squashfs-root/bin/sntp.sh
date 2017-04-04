#!/bin/sh
if [ ! "`route -n | grep ^0.0.0.0`" ]; then exit; fi
if [ `fping 8.8.8.8 | grep alive | wc -l` = 0 ]; then exit; fi
eval `flash get TIMESERVER_ADDR`
eval `flash get TIME_ZONE_SEL`
if [ "$TIMESERVER_ADDR" = "0.0.0.0" ]; then
TIMESERVER_ADDR=`fping -A pool.ntp.org | grep alive | cut -d ' ' -f 1`
fi
sntpclock $TIMESERVER_ADDR $TIME_ZONE_SEL
