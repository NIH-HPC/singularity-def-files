#! /bin/bash

cmd=$(basename ${BASH_SOURCE[0]})

# some scripts are actually named differently in the bin dir
# than in the docs. I'll create links for both versions and mangle
# the names here so that users can keep using the names as they are
# in the docs

[[ "${cmd}" == "format_input.py" ]] && cmd="lefse-${cmd}"
[[ "${cmd}" == "plot_cladogram.py" ]] && cmd="lefse-${cmd}"
[[ "${cmd}" == "plot_features.py" ]] && cmd="lefse-${cmd}"
[[ "${cmd}" == "plot_res.py" ]] && cmd="lefse-${cmd}"


libexecd=$(readlink -f $(dirname ${BASH_SOURCE[0]})/..)
image=${libexecd}/libexec/lefse.sif

singularity_opts=""

if [[ ${SLURM_JOB_ID:-none} != "none" && -d /lscratch/${SLURM_JOB_ID} ]]; then
    tmp=$(mktemp -d /lscratch/${SLURM_JOB_ID}/XXXX)
else
    tmp=$(mktemp -d $PWD/XXXX)
fi
trap "rm -rf $tmp" EXIT

singularity exec ${singularity_opts} \
  -B /spin1,/data,/gpfs,/lscratch,/scratch,/fdb,/vf,${tmp}:/tmp \
    ${image} ${cmd} "$@"
