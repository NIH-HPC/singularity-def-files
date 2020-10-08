#!/bin/bash

export SINGULARITY_BINDPATH="/vf,/gpfs,/spin1,/data,/lscratch,/scratch,/fdb"
export SINGULARITYENV_TESSDATA_PREFIX=/fdb/tesseract/tessdata_fast
app=tesseract
ver=4.1.1
sif_file=${app}-${ver}.sif

selfdir="/usr/local/apps/${app}/${ver}"

cmd="$(basename $0)"

singularity exec --cleanenv "${selfdir}/${sif_file}" "$cmd" "$@"
