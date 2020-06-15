#! /bin/bash

cmd=$(basename ${BASH_SOURCE[0]})
libexecd=$(readlink -f $(dirname ${BASH_SOURCE[0]})/..)
cpu_image=${libexecd}/libexec/stream.sqsh

if [[ ${SLURM_JOB_ID:-none} != "none" && -d /lscratch/${SLURM_JOB_ID} ]]; then
    tmp=$(mktemp -d /lscratch/${SLURM_JOB_ID}/XXXX)
else
    tmp=$(mktemp -d $PWD/XXXX)
fi
trap "rm -rf $tmp" EXIT

my_command="run"

export NO_GCE_CHECK='True'
singularity ${my_command} \
  -B /vf,/spin1,/data,/gpfs,/lscratch,/scratch,/fdb,${tmp}:/tmp \
    ${cpu_image} "STREAM" $@ 
