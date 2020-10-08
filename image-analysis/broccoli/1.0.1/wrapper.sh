#!/bin/bash

export SINGULARITY_BINDPATH="/vf,/gpfs,/spin1,/data,/lscratch,/scratch,/fdb"

export SINGULARITYENV_PYTHONNOUSERSITE=1

selfdir="$(dirname $(readlink -f ${BASH_SOURCE[0]}))"

cmd="broccolipipeline.sh"

singularity exec --cleanenv "${selfdir}/broccoli_1.0.1.sif" "$cmd" "$@"
