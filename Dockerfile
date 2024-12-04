# This image adds curl to Wings, making an internal health check possible
ARG VERSION_TAG
FROM ghcr.io/pterodactyl/wings:${VERSION_TAG}

# Copy curl binary
COPY --from=curlimages/curl:latest /usr/bin/curl /usr/bin/curl

# Copy architecture-specific libraries based on target platform
ARG TARGETARCH

# AMD64 dependencies
COPY --from=curlimages/curl:latest \
    /lib/ld-musl-x86_64.so.1 \
    /usr/lib/libcurl.so.4 \
    /lib/libz.so.1 \
    /lib/libc.musl-x86_64.so.1 \
    /usr/lib/libnghttp2.so.14 \
    /usr/lib/libidn2.so.0 \
    /usr/lib/libssh2.so.1 \
    /usr/lib/libpsl.so.5 \
    /lib/libssl.so.3 \
    /lib/libcrypto.so.3 \
    /usr/lib/libgssapi_krb5.so.2 \
    /usr/lib/libzstd.so.1 \
    /usr/lib/libbrotlidec.so.1 \
    /usr/lib/libunistring.so.5 \
    /usr/lib/libkrb5.so.3 \
    /usr/lib/libk5crypto.so.3 \
    /lib/libcom_err.so.2 \
    /usr/lib/libkrb5support.so.0 \
    /usr/lib/libbrotlicommon.so.1 \
    /usr/lib/libkeyutils.so.1 \
    /lib/ \
    /usr/lib/ \
    if [ "$TARGETARCH" = "amd64" ]

# ARM64 dependencies
COPY --from=curlimages/curl:latest \
    /lib/ld-musl-aarch64.so.1 \
    /usr/lib/libcurl.so.4 \
    /lib/libz.so.1 \
    /lib/libc.musl-aarch64.so.1 \
    /usr/lib/libnghttp2.so.14 \
    /usr/lib/libidn2.so.0 \
    /usr/lib/libssh2.so.1 \
    /usr/lib/libpsl.so.5 \
    /lib/libssl.so.3 \
    /lib/libcrypto.so.3 \
    /usr/lib/libgssapi_krb5.so.2 \
    /usr/lib/libzstd.so.1 \
    /usr/lib/libbrotlidec.so.1 \
    /usr/lib/libunistring.so.5 \
    /usr/lib/libkrb5.so.3 \
    /usr/lib/libk5crypto.so.3 \
    /lib/libcom_err.so.2 \
    /usr/lib/libkrb5support.so.0 \
    /usr/lib/libbrotlicommon.so.1 \
    /usr/lib/libkeyutils.so.1 \
    /lib/ \
    /usr/lib/ \
    if [ "$TARGETARCH" = "arm64" ]

# Set the library path to include both /lib and /usr/lib
ENV LD_LIBRARY_PATH=/lib:/usr/lib
