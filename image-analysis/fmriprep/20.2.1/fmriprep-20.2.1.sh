#!/bin/bash

unset PERL5LIB
unset PYTHONPATH

export SINGULARITY_BINDPATH="/vf,/gpfs,/spin1,/data,/lscratch,/scratch,/fdb,/usr/local/apps/freesurfer/license.txt"

export SINGULARITYENV_FS_LICENSE="/usr/local/apps/freesurfer/license.txt"

export SINGULARITYENV_PYTHONNOUSERSITE=1

selfdir="$(dirname $(readlink -f ${BASH_SOURCE[0]}))"

cmd="$(basename $0)"

singularity exec --cleanenv "${selfdir}/fmriprep-20.2.1.sif" "$cmd" "$@"
