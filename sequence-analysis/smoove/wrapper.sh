#! /bin/bash

cmd=$(basename ${BASH_SOURCE[0]})
libexecd=$(readlink -f $(dirname ${BASH_SOURCE[0]})/..)
image=${libexecd}/libexec/smoove.img        

singularity_opts=""

if [[ ${SLURM_JOB_ID:-none} != "none" && -d /lscratch/${SLURM_JOB_ID} ]]; then
    tmp=$(mktemp -d /lscratch/${SLURM_JOB_ID}/XXXX)
else
    tmp=$(mktemp -d $PWD/XXXX)
fi
trap "rm -rf $tmp" EXIT

my_command="exec" 

export NO_GCE_CHECK='True'
singularity ${my_command} ${singularity_opts} \
  -B /vf,/spin1,/usr/local/apps,/data,/gpfs,/lscratch,/scratch,/fdb,${tmp}:/tmp \
    ${image} "smoove" "$@" 
