#!/bin/bash

set -eu

export SCRIPT_DIR=$(cd $(dirname $(readlink $0 || echo $0));pwd)

DEST=${SCRIPT_DIR}/dest

if [ -d ${DEST} ]; then
  rm -r ${DEST}
fi

./configure --with-emacs=emacs \
              --with-lispdir=${DEST}/ \
              --infodir=${DEST}/info

make install

chmod a-x ${SCRIPT_DIR}/dest/lookup/*.elc
chmod a-x ${SCRIPT_DIR}/dest/lookup/*.el
