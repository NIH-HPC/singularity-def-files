export SINGULARITY_BINDPATH="/vf,/gpfs,/spin1,/data,/lscratch,/scratch,/fdb"

export SINGULARITYENV_PYTHONNOUSERSITE=1

selfdir="$(dirname $(readlink -f ${BASH_SOURCE[0]}))"

cmd="snp-sites"

singularity exec --cleanenv --no-home "${selfdir}/snp-sites.sif" "$cmd" "$@"
