#!/bin/bash

export BAMGINEER_TEST_DATA=/usr/local/apps/bamgineer/TEST_DATA
export SINGULARITY_BINDPATH="/vf,/gpfs,/spin1,/data,/lscratch,/scratch,/fdb,$BAMGINEER_TEST_DATA"
app=bamgineer
ver=2-20200624
sif_file=${app}-v2.sif

selfdir="/usr/local/apps/${app}/${ver}"

cmd="$(basename $0)"

singularity exec --cleanenv "${selfdir}/${sif_file}" "$cmd" "$@"
