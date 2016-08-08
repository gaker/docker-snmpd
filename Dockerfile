FROM alpine:latest
MAINTAINER Greg Aker <me@gregaker.net>

EXPOSE 161

ADD entrypoint.sh /

ENV SNMPD_RO_COMMUNITY my-community
ENV SNMPD_SYS_LOCATION docker
ENV SNMPD_SYS_CONTACT root@localhost
ENV SNMPD_DISKS /

RUN apk --no-cache add net-snmp net-snmp-libs net-snmp-tools coreutils \
    && rm -rf /var/cache/apk/*

ENTRYPOINT [ "/entrypoint.sh" ]
