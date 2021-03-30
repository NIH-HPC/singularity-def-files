#!/bin/bash
export SINGULARITY_BINDPATH="/vf,/gpfs,/spin1,/data,/scratch,/fdb"
dir="$(dirname $(readlink -f ${BASH_SOURCE[0]}))"
img="pyega3.sif"
cmd=$(basename "$0")
singularity exec "${dir}/${img}" $cmd "$@"
