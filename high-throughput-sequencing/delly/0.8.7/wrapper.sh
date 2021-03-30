# add links to gpfs
gpfs="$(echo /gs* | sed -e 's/ /,/g')"

export SINGULARITY_BINDPATH="/vf,${gpfs},/spin1,/data,/lscratch,/scratch,/fdb"

dir="$(dirname $(readlink -f ${BASH_SOURCE[0]}))"
cmd="$(basename $0)"
singularity exec --cleanenv "${dir}/delly.sif" "$cmd" "$@"
