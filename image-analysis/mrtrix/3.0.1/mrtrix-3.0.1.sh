#!/bin/bash

unset PERL5LIB
unset PYTHONPATH

export SINGULARITY_BINDPATH="/vf,/gpfs,/spin1,/data,/lscratch,/scratch,/fdb"

export SINGULARITYENV_PYTHONNOUSERSITE=1

# the following two env vars are for mrview to work!
export SINGULARITYENV_MESA_GL_VERSION_OVERRIDE=3.3
export SINGULARITYENV_DISPLAY=${DISPLAY}

selfdir="$(dirname $(readlink -f ${BASH_SOURCE[0]}))"

cmd="$(basename $0)"

singularity exec --cleanenv "${selfdir}/mrtrix-3.0.1.sif" "$cmd" "$@"
