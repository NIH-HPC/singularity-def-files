#!/bin/bash

unset PERL5LIB
unset PYTHONPATH

export SINGULARITY_BINDPATH="/vf,/gpfs,/spin1,/data,/lscratch,/scratch,/fdb,/usr/local/apps/fsl"

export SINGULARITYENV_PYTHONNOUSERSITE=1

# the following two env vars are for mrview to work!
export SINGULARITYENV_MESA_GL_VERSION_OVERRIDE=3.3
export SINGULARITYENV_DISPLAY=${DISPLAY}

# the following is because some mrtrx scripts use FSL
export SINGULARITYENV_FSLDIR=${FSLDIR}
export SINGULARITYENV_APPEND_PATH=${FSLDIR}/bin
export SINGULARITYENV_LD_LIBRARY_PATH=/usr/local/apps/fsl/CUDA/9.1
export SINGULARITYENV_FSLOUTPUTTYPE=NIFTI_GZ

selfdir="$(dirname $(readlink -f ${BASH_SOURCE[0]}))"

cmd="$(basename $0)"

singularity exec --cleanenv "${selfdir}/mrtrix-3.0.2-cuda9.1.sif" "$cmd" "$@"
EOF

