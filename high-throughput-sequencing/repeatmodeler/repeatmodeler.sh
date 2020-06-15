#!/bin/bash
export SINGULARITY_BINDPATH="/vf,/gpfs,/spin1,/data,/lscratch,/scratch,/fdb"
dir="$(dirname $(readlink -f ${BASH_SOURCE[0]}))"
export SINGULARITY_BINDPATH="${dir}/trf409.linux64:/opt/trf,${SINGULARITY_BINDPATH}"
img="repeatmodeler.sif"
cmd=$(basename "$0")
arg="$@"
singularity exec "${dir}/${img}" $cmd $arg
