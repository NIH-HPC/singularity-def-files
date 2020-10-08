#! /bin/bash

cmd=$(basename ${BASH_SOURCE[0]})
appdir=$(readlink -f $(dirname ${BASH_SOURCE[0]})/..)
image=${appdir}/libexec/roary.simg

if [[ ${SLURM_JOB_ID:-none} != "none" && -d /lscratch/${SLURM_JOB_ID} ]]; then
    tmp=$(mktemp -d /lscratch/${SLURM_JOB_ID}/container_temp_XXXX)
else
    tmp=$(mktemp -d $PWD/.XXXX)
fi
trap "rm -rf $tmp" EXIT

singularity exec \
  -B /spin1,/data,/gpfs,/lscratch,/scratch,/fdb,/vf,${tmp}:/tmp \
    ${image} ${cmd} "$@"
