FROM alpine:latest
MAINTAINER Greg Aker <me@gregaker.net>

EXPOSE 161 161/udp

ADD entrypoint.sh /

ADD patch.sh /tmp/patch.sh

RUN apk --no-cache add build-base perl perl-dev libtool file linux-headers coreutils \
    && mkdir /etc/snmp \
    && cd /tmp/ \
    && wget http://downloads.sourceforge.net/project/net-snmp/net-snmp/5.7.3/net-snmp-5.7.3.tar.gz \
    && tar zxvf net-snmp-5.7.3.tar.gz \
    && ./patch.sh \
    && cd /tmp/net-snmp-5.7.3 \
    && ./configure --prefix=/usr/local --disable-ipv6 --disable-snmpv1 --with-defaults \
    && make && make install \
    && apk del --purge build-base perl-dev libtool file linux-headers \
    && rm -rf /tmp/net-snmp-5.7.3/ \
    && rm -rf /var/cache/apk/*

ADD snmpd.conf /etc/snmp/snmpd.conf

VOLUME /host_proc

ENTRYPOINT [ "/entrypoint.sh" ]
