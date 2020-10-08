#!/bin/bash
SINGULARITY_BINDPATH="/gpfs,/gs3,/gs4,/gs5,/gs6,/spin1,/data,/scratch,/fdb,/lscratch"
SINGULARITY_BINDPATH="/usr/local/Anaconda,"${SINGULARITY_BINDPATH}
if [ -z ${CONDA_PREFIX+x} ]; then
    echo "No Anaconda environment is sourced.";
    echo "Using default python kernel version 3.5";
else
    echo "Anaconda environment found. Using: ${CONDA_PREFIX}";
    SINGULARITY_BINDPATH=${CONDA_PREFIX}:/opt/conda,${SINGULARITY_BINDPATH}
fi
export SINGULARITY_BINDPATH
dir=$(dirname  "$0")
cmd=$(basename "$0")

if [[ "${cmd}" == "atom" ]]; then
    # atom needs to run in the foreground
    singularity exec $dir/atom.img $cmd -f "$@"
else
    singularity exec $dir/atom.img $cmd "$@"
fi
