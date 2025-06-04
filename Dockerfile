FROM alpine:3.18.12

# install imagemagick
RUN apk add --no-cache \
 imagemagick=7.1.1.13-r1

COPY rootfs/ /

# run as default user
USER 1000

ENTRYPOINT ["/process-images.sh"]
CMD [ "--help" ]