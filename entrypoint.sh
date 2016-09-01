#!/bin/sh

if [ "$1" != "" ]; then
    exec "$@"
else
    /usr/sbin/snmpd -f -c /etc/snmp/snmpd.conf -Leo
fi

