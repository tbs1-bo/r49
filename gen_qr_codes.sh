#!/bin/bash

BASE="https://tbs1-bo.github.io/r49"
TGTDIR=qrcodes
# must be LMQH
ERR_CORRECTION=H 

command -v qrencode > /dev/null || (echo "qrencode must be installed" ; exit)

test -d $TGTDIR || mkdir $TGTDIR

for file in docs/*md; do
    slug=$(basename $file .md)
    for type in PNG SVG; do
        qrencode -l $ERR_CORRECTION -t $type -o $TGTDIR/$slug.$type $BASE/$slug
    done
done