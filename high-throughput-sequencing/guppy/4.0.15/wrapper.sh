#! /bin/bash

if [[ "${CUDA_VISIBLE_DEVICES:-none}" == "none" ]] ; then
    printf "guppy needs a GPU\n"
    exit 1
fi

cmd=$(basename ${BASH_SOURCE[0]})
libexecd=$(readlink -f $(dirname ${BASH_SOURCE[0]})/..)/libexec
gpu_image=${libexecd}/guppy-gpu.sif

singularity_opts="--nv"

if [[ ${SLURM_JOB_ID:-none} != "none" && -d /lscratch/${SLURM_JOB_ID} ]]; then
    tmp=$(mktemp -d /lscratch/${SLURM_JOB_ID}/XXXX)
else
    tmp=$(mktemp -d $PWD/XXXX)
fi
trap "rm -rf $tmp" EXIT

unset SINGULARITY_BINDPATH
singularity exec ${singularity_opts} \
  -B /spin1,/data,/gpfs,/lscratch,/scratch,/fdb,/vf,${tmp}:/tmp \
    ${gpu_image} ${cmd} "$@"
