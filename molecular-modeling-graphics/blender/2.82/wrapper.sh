#!/bin/bash
$(echo $LOADEDMODULES | grep singularity >& /dev/null) || ml singularity >& /dev/null
export SINGULARITY_BINDPATH="/gpfs,/spin1,/data,/lscratch,/scratch,/fdb,/usr/local/apps,/usr/local/CUDA"
selfdir="$(dirname $(readlink -f ${BASH_SOURCE[0]}))"
cmd="$(basename $0)"
singularity exec "${selfdir}/blender.sif" "$cmd" "$@"
