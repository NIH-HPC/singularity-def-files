#! /bin/bash

cmd=$(basename ${BASH_SOURCE[0]})
libexecd=$(readlink -f $(dirname ${BASH_SOURCE[0]})/..)
cpu_image=${libexecd}/libexec/accurity.simg

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

export LC_ALL=C
export NO_GCE_CHECK='True'
singularity ${my_command} ${singularity_opts} \
  -B $PWD:$PWD,/usr/local/bin:$PWD/code,/vf,/spin1,/gpfs,/lscratch,/scratch,/fdb,/usr/local/apps,${tmp}:/tmp \
    ${cpu_image} "$@"
