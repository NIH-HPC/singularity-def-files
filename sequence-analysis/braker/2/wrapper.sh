#!/bin/bash
export SINGULARITY_BINDPATH="/vf,/gpfs,/spin1,/data,/lscratch,/scratch,/fdb,/vf"
dir="$(dirname $(readlink -f ${BASH_SOURCE[0]}))"
cmd=$(basename "$0")
singularity exec $dir/braker.sif $cmd "$@"
