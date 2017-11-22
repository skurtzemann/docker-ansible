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

# Copy all the rootfs dir into the container
#
# terraform-inventory:  patched version with Exoscale support
#                       (https://github.com/PhilippeChepy/terraform-inventory/commit/f5f9c9609f39ba6a8ce31d36faec82fc368ff109)
COPY rootfs /

RUN \
    mkdir -p /root/.ssh/; touch /root/.ssh/known_hosts