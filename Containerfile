ARG FREEBSD_RELEASE

FROM ghcr.io/appjail-makejails/x11appjail-base:${FREEBSD_RELEASE}-x11

ARG NO_PKGCLEAN

LABEL org.opencontainers.image.title="Thunderbird" \
    org.opencontainers.image.description="Mozilla Thunderbird is standalone mail and news that stands above" \
    org.opencontainers.image.source="https://github.com/AppJail-makejails/thunderbird" \
    org.opencontainers.image.url="https://github.com/AppJail-makejails/thunderbird" \
    org.opencontainers.image.vendor="DtxdF" \
    org.opencontainers.image.authors="Jesús Daniel Colmenares Oviedo <dtxdf@disroot.org>"

RUN set -xe; \
    \
    sysrc clear_tmp_X=NO; \
    \
    pkg update; \
    pkg install thunderbird dbus; \
    \
    if [ -z "${NO_PKGCLEAN}" ]; then \
        pkg clean -a; \
        rm -rf /var/cache/pkg/*; \
    fi; \
    rm -rf /var/db/pkg/repos/*
