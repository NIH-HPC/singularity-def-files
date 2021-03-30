#! /bin/bash

cmd=$(basename ${BASH_SOURCE[0]})
prefix=$(readlink -f $(dirname ${BASH_SOURCE[0]})/..)
image=${prefix}/libexec/humann.sif

if [[ ${SLURM_JOB_ID:-none} != "none" && -d /lscratch/${SLURM_JOB_ID} ]]; then
    tmp=$(mktemp -d /lscratch/${SLURM_JOB_ID}/XXXX)
else
    tmp=$(mktemp -d $PWD/XXXX)
fi
trap "rm -rf $tmp" EXIT

SINGULARITY_BINDPATH="/spin1,/data,/gpfs,/lscratch,/scratch,/fdb,/vf,${tmp}:/tmp"
# that's where metaphlan looks...
SINGULARITY_BINDPATH+=",/fdb/humann2/3.0.0-alpha.3/metaphlan:/opt/conda/envs/app/lib/python3.7/site-packages/metaphlan/metaphlan_databases"
export SINGULARITY_BINDPATH

# need to mound the directory that contains the metaphlan2 database which
# it expects to be in a default location
singularity exec ${image} ${cmd} "$@"

