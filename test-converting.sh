#!/bin/bash

# use latest official build image from branch main
IMAGE="ghcr.io/matthiasbalke/imagemagick:main"
# use local build image
#IMAGE="matthiasbalke/imagemagick:local"

echo ">> resetting test bed..."
rm -f test/source/*.jpg || true
echo "done."
echo ""

echo ">> updating docker image..."
docker pull ${IMAGE}
echo "done."
echo ""

echo ">> converting images..."
docker run \
  --mount type=bind,src=$(pwd)/test/source,dst=/source \
  --mount type=bind,src=$(pwd)/test/process-images.sh,dst=/process-images.sh \
  --rm -it ${IMAGE}
echo "done."
echo ""

echo ">> listing target..."
ls -alR --color test/source
echo "done."
