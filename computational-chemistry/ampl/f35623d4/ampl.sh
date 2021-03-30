#!/bin/bash
export SINGULARITY_BINDPATH="/scratch/${USER}:/run/user,/vf,/gpfs,/spin1,/data,/lscratch,/scratch,/fdb,/usr/local/slurm,/usr/local/slurm-20.02,/usr/local/slurm_etc,/usr/local/munge,/var/run/munge,/usr/local/logs"
dir="$(dirname $(readlink -f ${BASH_SOURCE[0]}))"
module list 2>&1 | grep -q ampl || module --quiet load ampl/f35623d4
img="ampl.sif"
cmd=$(basename "$0")
singularity exec --nv "${dir}/${img}" $cmd "$@"
