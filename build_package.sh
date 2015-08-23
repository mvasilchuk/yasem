#!/bin/sh
ARCH=64
TMP_DIR="/tmp"
YASEM_OUT_DIR="yasem-$(uname -m)-$(date +"%F_%H-%M-%S")-$(git rev-parse --short HEAD)"
FULL_OUTPUT_DIR="${TMP_DIR}/${YASEM_OUT_DIR}"
CPU_COUNT=$(nproc)

$QTDIR/gcc_${ARCH}/bin/qmake -recursive YASEM_OUTPUT_DIR=${FULL_OUTPUT_DIR}
make -j${CPU_COUNT}
cd ${TMP_DIR}
tar -zcvf $1/${YASEM_OUT_DIR}.tar.gz ${YASEM_OUT_DIR}
cd -
rm "${FULL_OUTPUT_DIR}" -r
