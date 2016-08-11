FROM alpine:latest
MAINTAINER Greg Aker <me@gregaker.net>

EXPOSE 161 161/udp

ADD entrypoint.sh /

RUN apk --no-cache add coreutils net-snmp \
    && rm -rf /var/cache/apk/*

ADD snmpd.conf /etc/snmp/snmpd.conf

VOLUME /host_proc

ENTRYPOINT [ "/entrypoint.sh" ]
