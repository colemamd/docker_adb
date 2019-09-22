FROM debian:buster-slim

ARG OVERLAY_VERSION="v1.22.1.0"
ARG OVERLAY_ARCH="amd64"

RUN \
  apt-get update && \
  apt-get install -y --no-install-recommends ca-certificates curl \
    adb=1:8.1.0+r23-5 \
    android-libadb=1:8.1.0+r23-5 \
    android-libbase=1:8.1.0+r23-5 \
    android-libcutils=1:8.1.0+r23-5 \
    android-liblog=1:8.1.0+r23-5 && \
  curl -o \
    /tmp/s6-overlay.tar.gz -L \
	  "https://github.com/just-containers/s6-overlay/releases/download/${OVERLAY_VERSION}/s6-overlay-${OVERLAY_ARCH}.tar.gz" && \
  tar xfz \
    /tmp/s6-overlay.tar.gz -C / && \
  rm -rf \
    /tmp/* \
    /var/{cache,log}/* \
    /var/lib/apt/lists/*

COPY rootfs /

ENTRYPOINT ["/init"]

VOLUME /data
EXPOSE 5037
