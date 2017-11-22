FROM alpine:3.6

# Common tools from apline packages
RUN \
    # Define tagged repositories
    echo '@edge http://nl.alpinelinux.org/alpine/edge/main' >> /etc/apk/repositories && \
    #
    apk add --update \
    ca-certificates \
    bash \
    wget \
    py-pip \
    ansible@edge && \
    # Fix for paramiko import problem
    pip install packaging


RUN \
    mkdir -p /root/.ssh/; touch /root/.ssh/known_hosts