# imagemagick-docker

A dockerized version of [ImageMagick][imagemagick-url] including all needed dependencies.

## bundled software

 * `imagemagick=7.1.1.13-r1`

## usage

The image contains a simple shell script `/process-images.sh` which gets executed on container start. 

```sh
#!/bin/sh

magick $@
```
This script executes `magick` and takes the user arguments specified after `docker run`.
It can be used for simple file conversions or testing. Just mount a working directory with the images as e.g. `/source` and append the ImageMagick arguments.

```sh
docker run \
  --mount type=bind,src=$(pwd)/source,dst=/source \
  --rm -it ghcr.io/matthiasbalke/imagemagick:0.1.0-7.1.1.13-r1 \
  mogrify -format jpg '/source/Test.HEIC'
```

To run a more complex conversion, just mount a working directory with the images as e.g. `/source` and a script to `/process-images.sh` like this:
```sh
docker run \
  --mount type=bind,src=$(pwd)/source,dst=/source \
  --mount type=bind,src=$(pwd)/process-images.sh,dst=/process-images.sh \
  --rm -it ghcr.io/matthiasbalke/imagemagick:0.1.0-7.1.1.13-r1
```

## build locally
```sh
# build the image locally (tag: matthiasbalke/imagemagick:local)
./dev-build.sh
```

[imagemagick-url]: https://imagemagick.org/
