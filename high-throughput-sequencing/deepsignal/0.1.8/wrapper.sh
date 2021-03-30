#! /bin/bash

cmd=$(basename ${BASH_SOURCE[0]})
rootd=$(readlink -f $(dirname ${BASH_SOURCE[0]})/..)
image=${rootd}/libexec/deepsignal.sif
model=${rootd}/model

singularity_opts=""
if [[ "${CUDA_VISIBLE_DEVICES:-none}" == "none" || "${CUDA_VISIBLE_DEVICES}" == "NoDevFiles" ]]; then
    echo "No GPU available"
else
    echo "Using available GPU"
    singularity_opts+="--nv"
fi

if [[ ${SLURM_JOB_ID:-none} != "none" && -d /lscratch/${SLURM_JOB_ID} ]]; then
    tmp=$(mktemp -d /lscratch/${SLURM_JOB_ID}/XXXX)
else
    tmp=$(mktemp -d $PWD/XXXX)
fi
trap "rm -rf $tmp" EXIT

unset PYTHONPATH
export PYTHONNOUSERSITE=1
export OMP_NUM_THREADS=2
singularity exec ${singularity_opts} \
  -B /spin1,/data,/gpfs,/lscratch,/scratch,/fdb,/vf,${tmp}:/tmp,${model}:/model \
    ${image} ${cmd} "$@"
