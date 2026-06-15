#!/bin/bash

set -o errexit -o pipefail

# dynamically exchange ar -> $AR
sed -i 's/^ar rvs/$(AR) rvs/' src/leidenalg/Makefile
sed -i 's/^ar rvs/$(AR) rvs/' src/rigraph/Makefile

export DISABLE_AUTOBREW=1

${R} CMD INSTALL --build . ${R_ARGS}
