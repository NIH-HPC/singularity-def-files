#!/bin/bash
export SINGULARITY_BINDPATH="/vf,/gpfs,/spin1,/data,/lscratch,/scratch,/fdb"
export LANG=C
export LC_ALL=C
dir="$(dirname $(readlink -f ${BASH_SOURCE[0]}))"
img="transvar.sif"
cmd=$(basename "$0")
singularity exec "${dir}/${img}" $cmd "$@"
