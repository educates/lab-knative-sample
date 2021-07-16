FROM quay.io/eduk8s/base-environment:master

COPY --chown=1001:0 . /home/eduk8s/

RUN mkdir -p /home/eduk8s/bin && \
    curl -sL -o /home/eduk8s/bin/kn https://github.com/knative/client/releases/download/v0.23.2/kn-linux-amd64 && \
    chmod +x /home/eduk8s/bin/kn && \
    fix-permissions /home/eduk8s

RUN mv /home/eduk8s/workshop /opt/workshop

RUN fix-permissions /home/eduk8s