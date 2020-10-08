unset PYTHONPATH 

# this container doesn't have the /gs{4..10} symlinks in the root dir                                                                    
# so we need to mount these explicitly
gpfs_dirs="$(echo /gs* | tr ' ' ',')"

export SINGULARITY_BINDPATH="/vf,${gpfs_dirs},/spin1,/data,/lscratch,/scratch,/fdb"
export SINGULARITYENV_PYTHONNOUSERSITE=1

selfdir="$(dirname $(readlink -f ${BASH_SOURCE[0]}))"
cmd="$(basename $0)"
singularity exec --cleanenv "${selfdir}/cicero.sif" "$cmd" "$@"
