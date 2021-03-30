#!/bin/bash
export SINGULARITY_BINDPATH="/vf,/gpfs,/spin1,/data,/lscratch,/scratch,/fdb"
dir="$(dirname $(readlink -f ${BASH_SOURCE[0]}))"
img="megalodon.sif"
cmd=$(basename "$0")
arg="$@"
singularity exec --nv "${dir}/${img}" $cmd $arg
