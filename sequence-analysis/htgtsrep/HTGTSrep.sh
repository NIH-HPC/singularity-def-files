#!/bin/bash
export SINGULARITY_BINDPATH="/vf,/gpfs,/spin1,/data,/lscratch,/scratch,/fdb"
dir="$(dirname $(readlink -f ${BASH_SOURCE[0]}))"
img="HTGTSrep.sif"
cmd=$(basename "$0")
singularity exec "${dir}/${img}" python /opt/HTGTSrep/HTGTSrep/HTGTSrep.py "$@"
