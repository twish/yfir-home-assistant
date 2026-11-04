# Build context is the repository root, scoped by Dockerfile.dockerignore beside this file:
# docker build -f deploy/home-assistant/yfir_agent/Dockerfile . after make agent-dist.
FROM debian:bookworm-slim
ARG TARGETARCH
ARG VERSION=dev
LABEL org.opencontainers.image.version=$VERSION \
      org.opencontainers.image.source=https://github.com/twish/yfir
# systemd for journalctl alone; nothing of it runs.
RUN apt-get update \
    && apt-get install -y --no-install-recommends systemd jq ca-certificates \
    && rm -rf /var/lib/apt/lists/*
# Release artifacts arrive without their mode bits.
COPY --chmod=755 dist/yfir-agent_linux_${TARGETARCH} /usr/local/bin/yfir-agent
COPY --chmod=755 deploy/home-assistant/yfir_agent/entrypoint.sh /usr/local/bin/yfir-agent-entrypoint
ENV YFIR_PACKAGING=container
# The default AppArmor profile closes /proc/1/root, so the host's mount points cannot be measured.
ENV HOST_PROC_MOUNTINFO=/proc/self/mountinfo
VOLUME /data
ENTRYPOINT ["/usr/local/bin/yfir-agent-entrypoint"]
