#!/bin/sh

cd /source
find . -type f -iname '*.heic' -exec sh -c 'mogrify -format jpg "{}"' \;
