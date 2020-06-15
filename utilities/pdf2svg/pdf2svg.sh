#!/bin/bash
export SINGULARITY_BINDPATH="/vf,/gpfs,/spin1,/data,/lscratch,/scratch,/fdb"
dir="$(dirname $(readlink -f ${BASH_SOURCE[0]}))"
img="pdf2svg.sif"
cmd=$(basename "$0")
arg="$@"
singularity exec "${dir}/${img}" $cmd $arg
