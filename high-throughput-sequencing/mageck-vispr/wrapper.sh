#! /bin/bash

cmd=$(basename ${BASH_SOURCE[0]})
appdir=$(readlink -f $(dirname ${BASH_SOURCE[0]})/..)
image=${appdir}/libexec/mageck-vispr.simg

if [[ ${SLURM_JOB_ID:-none} != "none" && -d /lscratch/${SLURM_JOB_ID} ]]; then
    tmp=$(mktemp -d /lscratch/${SLURM_JOB_ID}/container_temp_XXXX)
else
    tmp=$(mktemp -d $PWD/.XXXX)
fi
trap "rm -rf $tmp" EXIT

if [[ "$cmd" == "mageck-vispr-snakemake" ]]; then
    cmd="snakemake"
fi

singularity exec \
  -B /spin1,/data,/gpfs,/lscratch,/scratch,/fdb,/vf,${tmp}:/tmp \
    ${image} ${cmd} "$@"
