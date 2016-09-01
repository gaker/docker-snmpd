FROM centos:7
MAINTAINER Greg Aker <me@gregaker.net>

EXPOSE 161 161/udp

ADD entrypoint.sh /

RUN yum -y install net-snmp net-snmp-utils

ADD snmpd.conf /etc/snmp/snmpd.conf

VOLUME /host_proc

ENTRYPOINT [ "/entrypoint.sh" ]
