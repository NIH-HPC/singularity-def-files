#!/bin/bash
$(echo $LOADEDMODULES | grep singularity >& /dev/null) || ml singularity >& /dev/null
if [[ $(hostname) =~ helix ]] ; then
  export SINGULARITY_BINDPATH="/gpfs,/spin1,/data,/scratch,/fdb,/usr/local/apps,/vf"
else
  export SINGULARITY_BINDPATH="/gpfs,/spin1,/data,/lscratch,/scratch,/fdb,/usr/local/apps,/vf"
fi
selfdir="$(dirname $(readlink -f ${BASH_SOURCE[0]}))"
cmd="$(basename $0)"
simg="pymol.simg"
singularity exec "${selfdir}/${simg}" "$cmd" "$@"
