#!/bin/bash
export SINGULARITY_BINDPATH="/vf,/gpfs,/spin1,/data,/scratch,/fdb,/lscratch"
dir=$(dirname  "$0")
cmd=$(basename "$0")
args="$@"
singularity exec $dir/bison.img $cmd $args
