FROM codercom/code-server:latest

USER root
RUN apt update && \
    apt install -y openssh-server && \
    rm -rf /var/lib/pat/lists/*

RUN sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config && \
    mkdir /run/sshd && \
    ssh-keygen -A


RUN sed -ri 's_#!/bin/sh_#!/bin/bash_g' /usr/bin/entrypoint.sh && \
    sed -ri '/^exec dumb/d' /usr/bin/entrypoint.sh && \
    echo '/usr/bin/code-server "$@" &' >> /usr/bin/entrypoint.sh&& \
    echo 'sudo /usr/sbin/sshd -D &' >> /usr/bin/entrypoint.sh&& \
    echo 'wait -n' >> /usr/bin/entrypoint.sh
    

USER 1000
EXPOSE 22

ENTRYPOINT ["/usr/bin/entrypoint.sh", "--bind-addr", "0.0.0.0:8080", "."]