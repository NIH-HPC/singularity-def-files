#!/bin/bash

container="scramble.sif"

export SINGULARITY_BINDPATH="/vf,/gpfs,/spin1,/data,/lscratch,/scratch,/fdb"
export SINGULARITYENV_PYTHONNOUSERSITE=1

cmd=$(basename "${BASH_SOURCE[0]}")
container_loc="$(dirname "${BASH_SOURCE[0]}")/../libexec/${container}"

singularity exec --cleanenv --no-home "${container_loc}" $cmd "$@"
