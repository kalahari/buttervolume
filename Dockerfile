FROM ubuntu:noble
LABEL Author="Forked from Buttervolume by Christophe Combelles"

RUN set -x; \
    apt-get update \
    && apt-get install -y --no-install-recommends \
        btrfs-progs \
        curl \
        ca-certificates \
        python3-setuptools \
        unzip \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /run/docker/plugins \
    && mkdir -p /var/lib/buttervolume/volumes \
    && mkdir -p /var/lib/buttervolume/snapshots \
    && mkdir /etc/buttervolume

COPY buttervolume.zip /
RUN mkdir /usr/src/buttervolume \
    && unzip -d /usr/src/buttervolume buttervolume.zip \
    && cd /usr/src/buttervolume \
    && python3 setup.py install

# # add tini to avoid sshd zombie processes
# ENV TINI_VERSION=v0.19.0
# ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
# RUN chmod +x /tini

COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
CMD ["run"]
