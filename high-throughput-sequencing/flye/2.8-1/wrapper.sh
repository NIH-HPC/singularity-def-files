#!/bin/bash
# call this through symbolic links

image="flye.sif"

SINGULARITY_BINDPATH="/gpfs,/spin1,/data,/scratch,/fdb,/lscratch,/vf"
export SINGULARITY_BINDPATH

cmd=$(basename "${BASH_SOURCE[0]}")
image_path="$(dirname "${BASH_SOURCE[0]}")/../libexec/${image}"
singularity exec "${image_path}" $cmd "$@"
