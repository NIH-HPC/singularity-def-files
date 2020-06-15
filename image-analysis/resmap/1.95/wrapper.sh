#!/bin/bash
export SINGULARITY_BINDPATH="/vf,/gpfs,/spin1,/data,/lscratch,/scratch,/fdb,/usr/local/apps,/usr/local/CUDA"
selfdir="$(dirname $(readlink -f ${BASH_SOURCE[0]}))"
cmd="$(basename $0)"
singularity exec --nv "${selfdir}/resmap_1.95_xvfb.simg" "$cmd" "$@"
