#!/bin/bash
export SINGULARITY_BINDPATH="/gpfs,/spin1,/data,/lscratch,/scratch,/fdb"
dir="$(dirname $(readlink -f ${BASH_SOURCE[0]}))"
cmd=$(basename "$0")
arg="$@"
singularity exec $dir/multiqc_1.10.sif $cmd $arg