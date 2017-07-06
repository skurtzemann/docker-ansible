FROM alpine:3.5

RUN apk add --update \
    ca-certificates \
    bash \
    wget \
    py-pip \
    ansible

ENV TI_VER 0.7-pre
RUN \
    wget -q -O /tmp/ti.zip https://github.com/adammck/terraform-inventory/releases/download/v${TI_VER}/terraform-inventory_v${TI_VER}_linux_amd64.zip && \
    unzip /tmp/ti.zip -d /usr/local/bin/ && \
    chmod +x /usr/local/bin/terraform-inventory && \
    rm -f /tmp/ti.zip

RUN \
    mkdir -p /root/.ssh/; touch /root/.ssh/known_hosts