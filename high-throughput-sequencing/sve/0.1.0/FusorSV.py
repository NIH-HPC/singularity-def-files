#!/bin/bash
# call this through symbolic links


SINGULARITY_BINDPATH="/gpfs,/spin1,/data,/scratch,/fdb,/lscratch"
export SINGULARITY_BINDPATH

image="sve.simg"
image_path="$(dirname "${BASH_SOURCE[0]}")/../libexec/${image}"
singularity exec "${image_path}" "/tools/SVE/scripts/FusorSV/FusorSV.py" "$@"
