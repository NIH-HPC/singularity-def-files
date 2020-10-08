# this container doesn't have the /gs{4..10} symlinks in the root dir                                                                    
# so we need to mount these explicitly
# gpfs_dirs="/gs10,/gs11,/gs12,/gs4,/gs5,/gs6,/gs7,/gs8,/gs9"

export SINGULARITY_BINDPATH="/vf,/gpfs,/spin1,/data,/lscratch,/scratch,/fdb"
export SINGULARITYENV_PYTHONNOUSERSITE=1

selfdir="$(dirname $(readlink -f ${BASH_SOURCE[0]}))"
cmd="$(basename $0)"

singularity exec --cleanenv "${selfdir}/rseqc.sif" "$cmd" "$@"

