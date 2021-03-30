#!/bin/bash
export SINGULARITY_BINDPATH="/vf,/gpfs,/spin1,/data,/lscratch,/scratch,/fdb"
dir="$(dirname $(readlink -f ${BASH_SOURCE[0]}))"
img="anvio.sif"
cmd=$(basename "$0")
singularity exec "${dir}/${img}" $cmd "$@"
