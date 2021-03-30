#! /bin/bash

cmd=$(basename ${BASH_SOURCE[0]})
appdir=$(readlink -f $(dirname ${BASH_SOURCE[0]})/..)
image=${appdir}/libexec/medaka.sif

gpu=""
if [[ "${CUDA_VISIBLE_DEVICES:-none}" == "none" || "${CUDA_VISIBLE_DEVICES}" == "NoDevFiles" ]]; then
    echo "No GPU available"
else
    echo "Using available GPU"
    gpu="--nv"
fi

if [[ ${SLURM_JOB_ID:-none} != "none" && -d /lscratch/${SLURM_JOB_ID} ]]; then
    tmp=$(mktemp -d /lscratch/${SLURM_JOB_ID}/XXXX)
else
    tmp=$(mktemp -d $PWD/XXXX)
fi
trap "rm -rf $tmp" EXIT

export PYTHONNOUSERSITE=1
singularity exec $gpu \
  -B /vf,/spin1,/data,/gpfs,/lscratch,/scratch,/fdb,${tmp}:/tmp \
    ${image} ${cmd} "$@"
