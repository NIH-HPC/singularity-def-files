#!/bin/bash

export SINGULARITY_BINDPATH="/vf,/gpfs,/spin1,/data,/lscratch,/scratch,/fdb"
app=cutadapt
ver=2.10
sif_file=${app}-${ver}.sif

selfdir="/usr/local/apps/${app}/${ver}"

cmd="$(basename $0)"

singularity exec --cleanenv "${selfdir}/${sif_file}" "$cmd" "$@"
