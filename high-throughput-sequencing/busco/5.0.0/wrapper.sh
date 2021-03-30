#!/bin/bash

export SINGULARITY_BINDPATH="/vf,/gpfs,/spin1,/data,/lscratch,/scratch,/fdb"
export SINGULARITYENV_BUSCO_CONFIG_FILE=$BUSCO_CONFIG_FILE
export SINGULARITYENV_AUGUSTUS_CONFIG_PATH=$AUGUSTUS_CONFIG_PATH

app=busco
ver=5.0.0
sif_file=${app}-${ver}.sif

selfdir="/usr/local/apps/${app}/${ver}"

cmd="$(basename $0)"

singularity exec --cleanenv "${selfdir}/libexec/${sif_file}" "$cmd" "$@"
