#! /bin/bash

cmd=$(basename ${BASH_SOURCE[0]})
libexecd=$(readlink -f $(dirname ${BASH_SOURCE[0]})/..)
image=${libexecd}/libexec/deepvariant-cpu.sif

singularity_opts=""
if [[ "${CUDA_VISIBLE_DEVICES:-none}" == "none" || "${CUDA_VISIBLE_DEVICES}" == "NoDevFiles" ]]; then
    echo "No GPU available"
else
    echo "Using available GPU"
    image="${libexecd}/libexec/deepvariant-gpu.sif"
    singularity_opts+="--nv"
fi

if [[ ${SLURM_JOB_ID:-none} != "none" && -d /lscratch/${SLURM_JOB_ID} ]]; then
    tmp=$(mktemp -d /lscratch/${SLURM_JOB_ID}/XXXX)
else
    tmp=$(mktemp -d $PWD/XXXX)
fi
trap "rm -rf $tmp" EXIT

export NO_GCE_CHECK='True'
singularity exec ${singularity_opts} \
  -B /spin1,/data,/gpfs,/lscratch,/scratch,/fdb,/vf,${tmp}:/tmp \
    ${image} ${cmd} "$@"
