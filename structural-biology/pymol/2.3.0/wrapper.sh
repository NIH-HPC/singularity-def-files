#!/bin/bash
echo $LOADEDMODULES | grep -q singularity >& /dev/null
ec=$?
if [[ $ec -ne 0 ]]; then
  module load singularity/3.5.3
fi

export SINGULARITY_BINDPATH="/gpfs,/spin1,/data,/lscratch,/scratch,/fdb,/usr/local/apps,/vf,/pdb"

selfdir="$(dirname $(readlink -f ${BASH_SOURCE[0]}))"

cmd="$(basename $0)"

singularity exec "${selfdir}/pymol_2.3.0.sif" "$cmd" "$@"
