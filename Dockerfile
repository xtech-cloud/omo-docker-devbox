# ************************************** 
#
# OMO DevBox
#
# ENV: DEV
# VERSION: 1.0.0
#
# *************************************

FROM alpine:3.7

MAINTAINER Easlee Liu "liu@easlee.me"

ENV container docker

VOLUME /omo
VOLUME /share

###############################
# install applications
###############################
RUN apk add --no-cache openssh
RUN apk add --no-cache sudo
RUN apk add --no-cache perl
RUN apk add --no-cache bash
RUN apk add --no-cache ca-certificates
RUN apk add --no-cache curl

RUN apk add --no-cache alpine-sdk
RUN apk add --no-cache git
RUN apk add --no-cache vim
RUN apk add --no-cache redis
RUN apk add --no-cache mysql
RUN apk add --no-cache mysql-client
RUN apk add --no-cache mongodb
RUN apk add --no-cache go

###############################
# activate systemd
###############################
VOLUME [ "/sys/fs/cgroup" ]

###############################
# generate ssh key
###############################
RUN ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key
RUN ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key
RUN ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key

###############################
# allow root login
###############################
RUN sed -i 's/#PermitRootLogin[ ]prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

RUN mkdir -p /omo
RUN mkdir -p /share

EXPOSE 22
COPY entry.sh /usr/local/bin/

ENTRYPOINT ["entry.sh"]
