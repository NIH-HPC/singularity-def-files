#! /bin/bash

cmd=$(basename ${BASH_SOURCE[0]})
libexecd=$(readlink -f $(dirname ${BASH_SOURCE[0]})/..)
image=${libexecd}/libexec/acfs_cpu.sqsh 

my_command="shell"
if [[ $# > 0 ]]; then
    my_command="exec"
fi

singularity $my_command  \
-B /spin1,/data,/gpfs,/lscratch,/scratch,/fdb \
${image} $@
