# This image adds curl to Wings, making an internal health check possible
ARG VERSION_TAG
FROM ghcr.io/pterodactyl/wings:${VERSION_TAG}

# Copy curl and its dependencies (Depenencies gathered with "docker container run --rm curlimages/curl:latest ldd /usr/bin/curl"
COPY --from=curlimages/curl:latest /usr/bin/curl /usr/bin/curl
COPY --from=curlimages/curl:latest /lib/ld-musl-x86_64.so.1 /lib/ld-musl-x86_64.so.1
COPY --from=curlimages/curl:latest /usr/lib/libcurl.so.4 /usr/lib/libcurl.so.4
COPY --from=curlimages/curl:latest /lib/libz.so.1 /lib/libz.so.1
COPY --from=curlimages/curl:latest /lib/libc.musl-x86_64.so.1 /lib/libc.musl-x86_64.so.1
COPY --from=curlimages/curl:latest /usr/lib/libnghttp2.so.14 /usr/lib/libnghttp2.so.14
COPY --from=curlimages/curl:latest /usr/lib/libidn2.so.0 /usr/lib/libidn2.so.0
COPY --from=curlimages/curl:latest /usr/lib/libssh2.so.1 /usr/lib/libssh2.so.1
COPY --from=curlimages/curl:latest /usr/lib/libpsl.so.5 /usr/lib/libpsl.so.5
COPY --from=curlimages/curl:latest /lib/libssl.so.3 /lib/libssl.so.3
COPY --from=curlimages/curl:latest /lib/libcrypto.so.3 /lib/libcrypto.so.3
COPY --from=curlimages/curl:latest /usr/lib/libgssapi_krb5.so.2 /usr/lib/libgssapi_krb5.so.2
COPY --from=curlimages/curl:latest /usr/lib/libzstd.so.1 /usr/lib/libzstd.so.1
COPY --from=curlimages/curl:latest /usr/lib/libbrotlidec.so.1 /usr/lib/libbrotlidec.so.1
COPY --from=curlimages/curl:latest /usr/lib/libunistring.so.5 /usr/lib/libunistring.so.5
COPY --from=curlimages/curl:latest /usr/lib/libkrb5.so.3 /usr/lib/libkrb5.so.3
COPY --from=curlimages/curl:latest /usr/lib/libk5crypto.so.3 /usr/lib/libk5crypto.so.3
COPY --from=curlimages/curl:latest /lib/libcom_err.so.2 /lib/libcom_err.so.2
COPY --from=curlimages/curl:latest /usr/lib/libkrb5support.so.0 /usr/lib/libkrb5support.so.0
COPY --from=curlimages/curl:latest /usr/lib/libbrotlicommon.so.1 /usr/lib/libbrotlicommon.so.1
COPY --from=curlimages/curl:latest /usr/lib/libkeyutils.so.1 /usr/lib/libkeyutils.so.1

# Set the library path to include both /lib and /usr/lib
ENV LD_LIBRARY_PATH=/lib:/usr/lib
