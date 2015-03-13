#!/bin/sh
CURRENT_DIR=$(pwd)
TMP_DIR="/tmp/yasem-$(uname -p)"
CURR_DATETIME="$(date +"%F_%H-%M-%S")"
OUT_DIR="${CURR_DATETIME}-$(git rev-parse --short HEAD)"
CPU_COUNT=$(nproc)

echo $OUT_DIR

/opt/Qt/5.4/gcc_64/bin/qmake -recursive YASEM_OUTPUT_DIR="${TMP_DIR}/${OUT_DIR}"
make -j${CPU_COUNT}
echo $TMP_DIR
cd $TMP_DIR
tar -zcvf $1/yasem-${CURR_DATETIME}.tar.gz $OUT_DIR 
cd -