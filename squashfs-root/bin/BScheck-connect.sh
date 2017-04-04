#!/bin/sh
if [ "`ifconfig $1 | grep inet`" ]; then echo 1 > $2; fi
