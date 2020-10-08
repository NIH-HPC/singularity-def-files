#!/bin/bash

export SINGULARITY_BINDPATH="/vf,/gpfs,/spin1,/data,/lscratch,/scratch,/fdb"

app=busco
ver=4.1.3
sif_file=${app}-${ver}.sif

selfdir="/usr/local/apps/${app}/${ver}"

cmd="$(basename $0)"

singularity exec --cleanenv "${selfdir}/libexec/${sif_file}" "$cmd" "$@"
