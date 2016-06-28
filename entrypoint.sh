#!/bin/sh

cat <<EOF > /etc/snmp/snmpd.conf
rocommunity ${SNMPD_RO_COMMUNITY}
sysLocation "${SNMPD_SYS_LOCATION}"
sysContact "${SNMPD_SYS_CONTACT}"
EOF

for DISK in $SNMPD_DISKS
do 
    cat <<EOF >> /etc/snmp/snmpd.conf
disk ${DISK}
EOF
done

if [ "$1" != "" ]; then
    exec "$@"
else
    /usr/sbin/snmpd -f -c /etc/snmp/snmpd.conf -LS 0-4 d -Lf /dev/null
fi

