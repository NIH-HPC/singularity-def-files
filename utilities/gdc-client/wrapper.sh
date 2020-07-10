#!/bin/bash

if [[ ${SLURM_JOB_ID:-none} != "none" && -d /lscratch/${SLURM_JOB_ID} ]]; then
    tmp=$(mktemp -d /lscratch/${SLURM_JOB_ID}/XXXXX)
else
    tmp=$(mktemp -d $PWD/XXXXX)
fi
trap "rm -rf $tmp" EXIT

export SINGULARITY_BINDPATH="/vf,/gpfs,/spin1,/data,/scratch,/fdb,${tmp}:/tmp"
app=gdc-client
ver=1.5.0
sif_file=${app}-${ver}.sif

selfdir="/usr/local/apps/${app}/${ver}"

cmd="$(basename $0)"

singularity exec --cleanenv "${selfdir}/${sif_file}" "$cmd" "$@"
