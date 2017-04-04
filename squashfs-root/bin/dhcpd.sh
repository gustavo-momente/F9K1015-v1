#!/bin/sh
killall udhcpd 2>/dev/null
eval `flash get IP_ADDR`
eval `flash get SUBNET_MASK`
eval `flash get DHCP_CLIENT_START`
eval `flash get DHCP_CLIENT_END`
eval `flash get LAN_LEASE_TIME`
eval `flash get DOMAIN_NAME`
echo "interface $1
start $DHCP_CLIENT_START
end $DHCP_CLIENT_END
opt subnet $SUBNET_MASK
opt router $IP_ADDR
opt dns $IP_ADDR
opt lease $LAN_LEASE_TIME" > /tmp/udhcpd.conf
if [ "$DOMAIN_NAME" ]; then
echo "opt domain $DOMAIN_NAME" >> /tmp/udhcpd.conf
fi
udhcpd /tmp/udhcpd.conf
