#! /bin/bash

cmd=$(basename ${BASH_SOURCE[0]})
libexecd=$(readlink -f $(dirname ${BASH_SOURCE[0]})/..)
gpu_image=${libexecd}/libexec/caffe2_gpu.sqsh
cpu_image=${libexecd}/libexec/caffe2_cpu.sqsh

singularity_opts=""
if [[ "${CUDA_VISIBLE_DEVICES:-none}" == "none" || "${CUDA_VISIBLE_DEVICES}" == "NoDevFiles" ]]; then
    echo "Using CPU implementation"
    image=${cpu_image}
else
    echo "Using GPU implementation"
    image=${gpu_image}
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
