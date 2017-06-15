FROM buildpack-deps:jessie-curl

RUN gpg \
    --keyserver hkp://ha.pool.sks-keyservers.net \
    --recv-keys 05CE15085FC09D18E99EFB22684A14CF2582E0C5

ENV INFLUXDB_VERSION 1.3.0rc1-c1.3.0rc2
RUN wget -q https://dl.influxdata.com/enterprise/releases/influxdb-meta_${INFLUXDB_VERSION}_amd64.deb && \
    dpkg -i influxdb-meta_${INFLUXDB_VERSION}_amd64.deb && \
    rm -f influxdb-meta_${INFLUXDB_VERSION}_amd64.deb*
COPY influxdb-meta.conf /etc/influxdb/influxdb-meta.conf

EXPOSE 8091

VOLUME /var/lib/influxdb

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["influxd-meta"]
