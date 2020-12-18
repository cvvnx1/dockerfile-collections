FROM ubuntu:18.04
LABEL Maintainer="Tony Ho <cvvnx1@hotmail.com>"
LABEL Name="grok_exporter"
LABEL Version="1.0.0.RC5"

ENV GROK_ARCH "grok_exporter-1.0.0.RC5.linux-amd64"
ENV GROK_VERSION "v1.0.0.RC5"

VOLUME ["/log/"]
WORKDIR /grok

RUN apt-get update -qqy \
    && apt-get upgrade -qqy \
    && apt-get install --no-install-recommends -qqy \
       wget unzip ca-certificates \
    && update-ca-certificates \
    && wget https://github.com/fstab/grok_exporter/releases/download/$GROK_VERSION/$GROK_ARCH.zip \
    && unzip $GROK_ARCH.zip \
    && cp -a $GROK_ARCH/grok_exporter ./ \
    && rm -f $GROK_ARCH.zip \
    && apt-get --autoremove purge -qqy \
       wget unzip ca-certificates

CMD ["./grok_exporter", "-config", "/grok/config.yml"]
