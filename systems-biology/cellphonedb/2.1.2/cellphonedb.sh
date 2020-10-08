#!/bin/bash
export SINGULARITY_BINDPATH="/gpfs,/spin1,/data,/lscratch,/scratch,/fdb"
dir="$(dirname $(readlink -f ${BASH_SOURCE[0]}))"
img="cellphonedb.sif"
cmd=$(basename "$0")
singularity exec "${dir}/${img}" $cmd "$@"
