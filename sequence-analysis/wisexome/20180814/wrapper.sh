#! /bin/bash

cmd=$(basename ${BASH_SOURCE[0]})
libexecd=$(readlink -f $(dirname ${BASH_SOURCE[0]})/..)
image=${libexecd}/libexec/WISExome.sqsh             
echo "$gpu_image"

singularity_opts=""
if [[ "${CUDA_VISIBLE_DEVICES:-none}" == "none" || "${CUDA_VISIBLE_DEVICES}" == "NoDevFiles" ]]; then
    echo "Using CPU implementation"
else
    echo "Using GPU implementation"
    singularity_opts+="--nv"
fi

if [[ ${SLURM_JOB_ID:-none} != "none" && -d /lscratch/${SLURM_JOB_ID} ]]; then
    tmp=$(mktemp -d /lscratch/${SLURM_JOB_ID}/XXXX)
else
    tmp=$(mktemp -d $PWD/XXXX)
fi
trap "rm -rf $tmp" EXIT

my_command="shell"
if [[ $# > 0 ]]; then
    my_command="exec"
fi

export NO_GCE_CHECK='True'
singularity ${my_command} ${singularity_opts} \
  -B /vf,/spin1,/data,/gpfs,/lscratch,/scratch,/fdb,${tmp}:/tmp \
    ${image} "$@"
