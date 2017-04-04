#!/bin/sh
exec /etc/udhcpc/br0.$1 2>/dev/null
