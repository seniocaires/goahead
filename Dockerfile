FROM debian

WORKDIR /opt

RUN apt update && apt install -y git make build-essential \
    && git clone https://github.com/embedthis/goahead.git \
    && cd goahead && make SHOW=1 && make SHOW=1 install \
    && cp build/linux-x64-default/bin/self.key /etc/goahead/ \
    && cp build/linux-x64-default/bin/self.crt /etc/goahead/ \
    && cd / && rm -rf /opt/goahead

EXPOSE 80 443

CMD ["goahead", "-v", "--home", "/etc/goahead", "/var/www/goahead"]
