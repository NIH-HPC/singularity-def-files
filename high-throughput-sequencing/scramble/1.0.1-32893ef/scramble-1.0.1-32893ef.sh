#!/bin/bash

cmd=$(basename ${BASH_SOURCE[0]})
libexecd=$(readlink -f $(dirname ${BASH_SOURCE[0]})/..)
container=${libexecd}/libexec/scramble-1.0.1-32893ef.sif   

export SINGULARITY_BINDPATH="/vf,/gpfs,/data,/spin1,/lscratch,/scratch,/fdb"
export SINGULARITYENV_PYTHONNOUSERSITE=1

cmd="shell"
if [[ $# > 0 ]]; then
    cmd="exec"
    singularity_opts="--cleanenv --no-home"
fi

singularity ${cmd} ${singularity_opts} ${container} "$@"
