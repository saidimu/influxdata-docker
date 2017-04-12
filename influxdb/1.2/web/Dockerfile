FROM buildpack-deps:jessie-curl

RUN gpg \
    --keyserver hkp://ha.pool.sks-keyservers.net \
    --recv-keys 05CE15085FC09D18E99EFB22684A14CF2582E0C5

ENV INFLUXDB_VERSION 1.2.2
RUN \
    # wget -q https://s3.amazonaws.com/influx-enterprise/releases/influx-enterprise_${INFLUXDB_VERSION}_amd64.deb.asc && \
    wget -q https://s3.amazonaws.com/influx-enterprise/releases/influx-enterprise_${INFLUXDB_VERSION}_amd64.deb && \
    # gpg --batch --verify influxdb-enterprise_${INFLUXDB_VERSION}_amd64.deb.asc influxdb-enterprise_${INFLUXDB_VERSION}_amd64.deb && \
    dpkg -i influx-enterprise_${INFLUXDB_VERSION}_amd64.deb && \
    rm -f influx-enterprise_${INFLUXDB_VERSION}_amd64.deb*
COPY influx-enterprise.conf /etc/influx-enterprise/influx-enterprise.conf

EXPOSE 3000

VOLUME /var/lib/influx-enterprise

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["influx-enterprise"]
