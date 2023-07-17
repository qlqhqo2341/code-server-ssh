FROM codercom/code-server:latest

USER root
RUN apt update && \
    apt install -y openssh-server && \
    rm -rf /var/lib/pat/lists/*

RUN sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config && \
    mkdir /run/sshd && \
    ssh-keygen -A

USER 1000
EXPOSE 22

ADD double_entrypoint.sh /usr/bin/double_entrypoint.sh
ENTRYPOINT ["/usr/bin/double_entrypoint.sh", "--bind-addr", "0.0.0.0:8080", "."]