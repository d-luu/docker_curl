FROM ubuntu:16.04

ENV CURL_VERSION=7.65.3

RUN sed -i 's/^# deb-src /deb-src /' /etc/apt/sources.list && \
    apt update && \
    apt -y install build-essential nghttp2 libnghttp2-dev libssl-dev wget libssh2-1-dev libpsl-dev && \
    apt -y build-dep curl 

RUN wget https://curl.haxx.se/download/curl-$CURL_VERSION.tar.gz && \
    tar xzf curl-$CURL_VERSION.tar.gz && \
    cd curl-$CURL_VERSION && \
    ./configure --with-nghttp2 --prefix=/usr/local --with-ssl --disable-ldap --enable-ipv6 --enable-unix-sockets --with-libssh2 --with-pic --without-libidn --without-libidn2 && \
    make && \
    make install && \
    ldconfig

