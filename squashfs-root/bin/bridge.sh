#!/bin/sh
br=$1
brctl addbr $br
brctl setageing $br 60
brctl setfd $br 0
brctl stp $br 0
while [ $2 ]; do
brctl addif $br $2
ifconfig $2 0.0.0.0
shift
done
ifconfig $br 0.0.0.0
