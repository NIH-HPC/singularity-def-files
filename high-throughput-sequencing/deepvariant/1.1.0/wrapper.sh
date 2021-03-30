#! /bin/bash

cmd=$(basename ${BASH_SOURCE[0]})
libexecd=$(readlink -f $(dirname ${BASH_SOURCE[0]})/..)
image=${libexecd}/libexec/deepvariant-cpu.sif

singularity_opts=""
if [[ "${CUDA_VISIBLE_DEVICES:-none}" == "none" || "${CUDA_VISIBLE_DEVICES}" == "NoDevFiles" ]]; then
    echo "No GPU available"
else
    echo "Using available GPU"
    image="${libexecd}/libexec/deepvariant-gpu.sif"
    singularity_opts+="--nv"
    if [[ "$cmd" == "run_deepvariant" ]] ; then
        cat <<-__EOF__

		###########################################################################
		#                                                                         #
		#  Running the combined 'run_deepvariant' on GPU is not efficient since   #
		#  the first and last step are not GPU optimized. Please use the scripts  #
		#  for the individual steps. Please contact us at staff@hpc.nih.gov if    #
		#  you have any questions.                                                #
		#                                                                         #
		###########################################################################

		__EOF__
    fi
fi

if [[ ${SLURM_JOB_ID:-none} != "none" && -d /lscratch/${SLURM_JOB_ID} ]]; then
    tmp=$(mktemp -d /lscratch/${SLURM_JOB_ID}/XXXX)
else
    tmp=$(mktemp -d $PWD/XXXX)
fi
trap "rm -rf $tmp" EXIT

export NO_GCE_CHECK='True'
unset PYTHONPATH
export PYTHONNOUSERSITE=1
export OMP_NUM_THREADS=2
singularity exec ${singularity_opts} \
  -B /spin1,/data,/gpfs,/lscratch,/scratch,/fdb,/vf,${tmp}:/tmp \
    ${image} ${cmd} "$@"
