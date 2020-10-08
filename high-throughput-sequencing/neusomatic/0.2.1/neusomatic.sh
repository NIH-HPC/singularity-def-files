#!/bin/bash
export SINGULARITY_BINDPATH="/vf,/gpfs,/spin1,/data,/lscratch,/scratch,/fdb"
dir="$(dirname $(readlink -f ${BASH_SOURCE[0]}))"
cmd=$(basename "$0")
arg="$@"

export SINGULARITY_NV=1
cmd=$(singularity exec $dir/neusomatic.sif which $cmd)
singularity exec $dir/neusomatic.sif python $cmd $arg
