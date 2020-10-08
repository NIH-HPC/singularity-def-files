#!/bin/bash

export SINGULARITY_BINDPATH="/vf,/gpfs,/spin1,/data,/lscratch,/scratch,/fdb"

app=maggie
ver=0.3.4
sif_file=${app}-${ver}.sif

selfdir="/usr/local/apps/MAGGIE/${ver}"

cmd="$(basename $0)"

singularity exec --cleanenv "${selfdir}/libexec/${sif_file}" "$cmd" "$@"
