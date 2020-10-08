#! /bin/bash

cmd=$(basename ${BASH_SOURCE[0]})
prefix=$(readlink -f $(dirname ${BASH_SOURCE[0]})/..)
image=${prefix}/libexec/humann2.sif

if [[ ${SLURM_JOB_ID:-none} != "none" && -d /lscratch/${SLURM_JOB_ID} ]]; then
    tmp=$(mktemp -d /lscratch/${SLURM_JOB_ID}/XXXX)
else
    tmp=$(mktemp -d $PWD/XXXX)
fi
trap "rm -rf $tmp" EXIT

SINGULARITY_BINDPATH="/spin1,/data,/gpfs,/lscratch,/scratch,/fdb,/vf,${tmp}:/tmp"
# that's where metaphlan looks...
SINGULARITY_BINDPATH+=",/fdb/humann2/2.8.1/metaphlan:/opt/conda/bin/databases"
export SINGULARITY_BINDPATH

# need to mound the directory that contains the metaphlan2 database which
# it expects to be in a default location
singularity exec ${image} ${cmd} "$@"

