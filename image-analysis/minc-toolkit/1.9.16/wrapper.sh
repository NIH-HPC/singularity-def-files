#!/bin/bash
# call this through symbolic links

SINGULARITY_BINDPATH="/gpfs,/spin1,/data,/scratch,/fdb,/vf,/lscratch"
if [[ ${SLURM_JOB_ID:-none} != "none" && -d /lscratch/$SLURM_JOB_ID ]]; then
    SINGULARITY_BINDPATH+="/lscratch/${SLURM_JOB_ID}:/tmp"
fi
export SINGULARITY_BINDPATH

image="minc.sqsh"
cmd=$(basename "${BASH_SOURCE[0]}")
libexecd=$(readlink -f $(dirname ${BASH_SOURCE[0]})/..)
image_path="${libexecd}/libexec/${image}"
singularity exec "${image_path}" "${cmd}" "$@"
