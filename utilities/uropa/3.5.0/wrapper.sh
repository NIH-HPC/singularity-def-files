#!/bin/bash

export SINGULARITY_BINDPATH="/vf,/gpfs,/spin1,/data,/lscratch,/scratch,/fdb,/usr/bin/paste"

export SINGULARITYENV_PYTHONNOUSERSITE=1

selfdir="$(dirname $(readlink -f ${BASH_SOURCE[0]}))"

cmd="$(basename $0)"

singularity exec --cleanenv "${selfdir}/uropa_3.5.0.sif" "$cmd" "$@"
