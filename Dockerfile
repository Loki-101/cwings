# This image adds curl to Wings, making an internal health check possible
ARG VERSION_TAG

# Build stage
FROM curlimages/curl:latest AS build

WORKDIR /build
RUN mkdir -p curl_deps/usr/bin curl_deps/usr/lib curl_deps/lib

# Copy curl binary
RUN cp /usr/bin/curl curl_deps/usr/bin/

# Use ldd to identify dependencies and copy them, maintaining their paths
RUN ldd /usr/bin/curl | grep '=>' | awk '{print $3}' | \
    while read -r lib; do \
        if [[ $lib == /usr/lib/* ]]; then \
            cp "$lib" "curl_deps/usr/lib/$(basename $lib)"; \
        elif [[ $lib == /lib/* ]]; then \
            cp "$lib" "curl_deps/lib/$(basename $lib)"; \
        fi \
    done

# Run stage
FROM ghcr.io/pterodactyl/wings:${VERSION_TAG}

# Copy curl and its dependencies from build stage
COPY --from=build /build/curl_deps/ /

# Set the library path
ENV LD_LIBRARY_PATH=/lib:/usr/lib
