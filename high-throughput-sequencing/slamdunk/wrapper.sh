#!/bin/bash

export SINGULARITY_BINDPATH="/vf,/gpfs,/spin1,/data,/lscratch,/scratch,/fdb"
app=slamdunk
ver=0.4.3
sif_file=slamdunk.sif

selfdir="/usr/local/apps/${app}/${ver}"

cmd="$(basename $0)"

singularity exec --cleanenv "${selfdir}/${sif_file}" "$cmd" "$@"
