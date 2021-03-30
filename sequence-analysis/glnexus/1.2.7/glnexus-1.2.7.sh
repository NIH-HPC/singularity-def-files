#!/bin/bash

export SINGULARITY_BINDPATH="/gpfs,/spin1,/data,/lscratch,/scratch,/fdb,/vf"

export SINGULARITYENV_PYTHONNOUSERSITE=1

selfdir="$(dirname $(readlink -f ${BASH_SOURCE[0]}))"

cmd="/GLnexus/glnexus_cli"

singularity exec --cleanenv --no-home "${selfdir}/glnexus-1.2.7.sif" "$cmd" "$@"
