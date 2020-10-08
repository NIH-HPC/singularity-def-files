#!/bin/bash
SINGULARITY_BINDPATH="/vf,/gpfs,/spin1,/data,/scratch,/fdb,/lscratch"
export SINGULARITY_BINDPATH
dir=$(dirname  "$0")
cmd=$(basename "$0")
args="$@"
singularity exec --nv --bind $PWD:/mnt --pwd /mnt $dir/digits.simg $cmd $args



