#! /bin/bash

cmd=$(basename ${BASH_SOURCE[0]})
libexecd=$(readlink -f $(dirname ${BASH_SOURCE[0]})/..)
cpu_image=${libexecd}/libexec/bigSCale2.sqsh                           

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

echo 
echo "INFO: You are now opening a new shell within a Singularity container. Your"
echo "INFO: environment will change and you will have access to a different set of"
echo "INFO: commands and executables. Please remember to exit this shell when you are"
echo "INFO: finished with your session."
echo 

singularity ${my_command} ${singularity_opts} \
  -B /vf,/spin1,/data,/gpfs,/lscratch,/scratch,/fdb,${tmp}:/tmp \
    ${cpu_image} "$@"
