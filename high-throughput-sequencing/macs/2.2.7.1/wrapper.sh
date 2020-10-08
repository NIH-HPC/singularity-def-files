#!/bin/bash
export SINGULARITY_BINDPATH="/gpfs,/spin1,/data,/lscratch,/scratch,/fdb"
dir="$(dirname $(readlink -f ${BASH_SOURCE[0]}))"
cmd=$(basename "$0")
singularity exec $dir/macs2.sif $cmd "$@"
