#!/bin/bash

BASE="https://tbs1-bo.github.io/r49"
TGTDIR=qrcodes
# must be LMQH
ERR_CORRECTION=H 

command -v qrencode > /dev/null || echo "qrencode must be installed" || exit

test -d $TGTDIR || mkdir $TGTDIR

for type in PNG SVG; do
    qrencode -l $ERR_CORRECTION -o $TGTDIR/co2.$type $BASE/co2
done
