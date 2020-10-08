#!/bin/bash
export SINGULARITY_BINDPATH="/vf,/gpfs,/spin1,/data,/lscratch,/scratch,/fdb,/usr/local/apps"
selfdir="$(dirname $(readlink -f ${BASH_SOURCE[0]}))"
cmd="$(basename $0)"
singularity exec "${selfdir}/terastitcher_1.11.10.simg" "$cmd" "$@"
