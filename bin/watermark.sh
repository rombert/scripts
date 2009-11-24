#!/bin/sh

# Courtesy of http://www.imagemagick.org/Usage/annotating/#wmark_text

WATERMARK=${WATERMARK:-COPIE}
FILL=#80808040

convert -size 240x100 xc:none -fill $FILL -pointsize 40 \
        -gravity NorthWest -draw "text 60,60 '$WATERMARK'" \
        miff:- |\
        composite -tile - $1 $2


