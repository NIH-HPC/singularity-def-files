#!/bin/bash

cmd=$(basename ${BASH_SOURCE[0]})
image=$XHLA_BIN/../libexec/xHLA.sqsh

if [[ ${SLURM_JOB_ID:-none} != "none" && -d /lscratch/${SLURM_JOB_ID} ]]; then
    tmp=$(mktemp -d /lscratch/${SLURM_JOB_ID}/XXXX)
else
    tmp=$(mktemp -d $PWD/XXXX)
fi
trap "rm -rf $tmp" EXIT

singularity exec \
	-B /vf,/spin1,/data,/gpfs,/lscratch,/scratch,/fdb \
	${image} python /opt/bin/run.py "$@"

