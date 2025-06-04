# imagemagick-docker

A dockerized version of [ImageMagick][imagemagick-url] including all needed dependencies.

## Bundled Software

 * `imagemagick=7.1.1.13-r1`

## Usage

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

## Build Locally
```sh
# build the image locally (tag: matthiasbalke/imagemagick:local)
./dev-build.sh
```

## Releases

Releases are based on [Semantic Versioning][semver], and use the format
of ``MAJOR.MINOR.PATCH-BUNDLED_IMAGEMAGICK_VERSION``. In a nutshell, the version will be incremented
based on the following:

- ``MAJOR``: Incompatible or major changes.
- ``MINOR``: Backwards-compatible new features and enhancements.
- ``PATCH``: Backwards-compatible bugfixes and package updates.
- ``BUNDLED_IMAGEMAGICK_VERSION``: The ImageMagick version used in the image.

## License

MIT License

Copyright (c) 2025 Matthias Balke

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

[imagemagick-url]: https://imagemagick.org/
[semver]: http://semver.org/spec/v2.0.0.html
