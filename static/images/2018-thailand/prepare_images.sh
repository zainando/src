#!/usr/bin/env bash

# verbose mode
set -x

for dir in */; do cd ${dir} && \
    # auto re-orient with exif data and resize image if necessary
    mogrify -auto-orient -resize 1024x1024\> *[^thumb].jpg ; \
    # create thumbnail
    for file in *[^thumb].jpg; do convert -resize 300x300\> ${file} $(basename ${file} .jpg)-thumb.jpg; done ; cd ..; done

#for dir in */; do cd ${dir}; rm *thumb.jpg;  cd ..; done
