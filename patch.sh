#!/bin/sh
grep -lr '"/proc' ./net-snmp-5.7.3/ | while read line
do
    #echo $line
    sed -i 's@"/proc@"/host_proc@g' $line
done
