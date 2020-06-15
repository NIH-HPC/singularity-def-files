#!/bin/bash
export SINGULARITY_BINDPATH="/vf,/gpfs,/spin1,/data,/lscratch,/scratch,/fdb"
dir="$(dirname $(readlink -f ${BASH_SOURCE[0]}))"
img="deepmedic.sif"
cmd=$(basename "$0")
arg="$@"
# comment out the env var below if you need to debug
export SINGULARITYENV_PYTHONWARNINGS="ignore"
singularity exec --nv "${dir}/${img}" $cmd $arg
