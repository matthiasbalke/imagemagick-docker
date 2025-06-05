FROM alpine:3.18.12

# install imagemagick
RUN apk add --no-cache \
 imagemagick=7.1.1.13-r1 \
 python3=3.11.12-r1

COPY rootfs/ /

# run as default user
USER 1000

ENTRYPOINT ["python3", "/process-images.py"]
CMD [ "--help" ]