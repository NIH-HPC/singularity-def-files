#! /bin/bash

cmd=$(basename ${BASH_SOURCE[0]})
appdir=$(readlink -f $(dirname ${BASH_SOURCE[0]})/..)
image=${appdir}/libexec/pychopper.sif

if [[ ${SLURM_JOB_ID:-none} != "none" && -d /lscratch/${SLURM_JOB_ID} ]]; then
    tmp=$(mktemp -d /lscratch/${SLURM_JOB_ID}/XXXX)
else
    tmp=$(mktemp -d $PWD/XXXX)
fi
trap "rm -rf $tmp" EXIT

export PYTHONNOUSERSITE=1
singularity exec \
  -B /vf,/spin1,/data,/gpfs,/lscratch,/scratch,/fdb,${tmp}:/tmp \
    ${image} ${cmd} "$@"
