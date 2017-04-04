#!/bin/sh
if [ ! -f /tmp/flash.inc ]; then flash all2 > /tmp/flash.inc; fi
. /tmp/flash.inc
