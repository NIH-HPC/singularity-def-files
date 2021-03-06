#!/bin/bash

# bind the mount points
export SINGULARITY_BINDPATH="/gpfs,/spin1,/data,/lscratch,/scratch,/fdb"
dir="$(dirname $(readlink -f ${BASH_SOURCE[0]}))"
cmd=$(basename "$0")
arg="$@"

singularity exec $dir/asgal.simg python3 /galig/scripts/$cmd $arg

