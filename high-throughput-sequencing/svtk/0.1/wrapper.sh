#!/bin/bash
dir="$(dirname $(readlink -f ${BASH_SOURCE[0]}))"
cmd=$(basename "$0")
singularity exec $dir/svtk.sif $cmd "$@"
