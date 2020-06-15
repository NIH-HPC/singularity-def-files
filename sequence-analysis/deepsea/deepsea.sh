#!/bin/bash
export SINGULARITY_BINDPATH="/gpfs,/spin1,/data,/lscratch,/scratch,/fdb"
export SINGULARITY_BINDPATH="/fdb/deepsea/0.94c/Gerp:/root/DeepSEA-v0.94/resources/Gerp,${SINGULARITY_BINDPATH}"
export SINGULARITY_BINDPATH="/fdb/deepsea/0.94c/phastCons:/root/DeepSEA-v0.94/resources/phastCons,${SINGULARITY_BINDPATH}"
export SINGULARITY_BINDPATH="/fdb/deepsea/0.94c/phyloP:/root/DeepSEA-v0.94/resources/phyloP,${SINGULARITY_BINDPATH}"

dir="$(dirname $(readlink -f ${BASH_SOURCE[0]}))"
img="deepsea.sif"
cmd=$(basename "$0")

HELPSTRING="
DeepSEA is a deep learning-based algorithmic framework for predicting the
chromatin effects of sequence alterations with single nucleotide sensitivity.
DeepSEA can accurately predict the epigenetic state of a sequence, including
transcription factors binding, DNase I sensitivities and histone marks in
multiple cell types, and further utilize this capability to predict the
chromatin effects of sequence variants and prioritize regulatory variants.

Usage:
    rundeepsea.py <path to fasta/bed/vcf> <output directory>
    rundeepsea-insilicomut.py <path to fasta/bed/vcf> <output directory> <index of feature>

Notes:
    - rundeepsea.py and rundeepsea-insilicomut.py require 2 and 3 arguments
      respectively. Fewer arguments will resutl in an error and extra agruments
      will be ignored.
    - Do *not* preface either of these scripts with 'python'. Both scripts will
      be automatically run using the appropriate version of python.
    - These scripts are installed as a Singularity container and this help
      message is provided by a wrapper script.

For more information please see
    http://deepsea.princeton.edu

"

# do some really basic error checking on the input args

if [ "X${cmd}" == "Xrundeepsea.py" ]; then
    if [ $# -lt 2 ]; then
        echo "ERROR: $HELPSTRING"
        exit 1
    fi
    if [ $# -gt 2 ]; then
        echo "WARNING: Extra arguments will be ignored."
    fi
fi

if [ "X${cmd}" == "Xrundeepsea-insilicomut.py" ]; then
    if [ $# -lt 3 ]; then
        echo "ERROR: $HELPSTRING"
        exit 1
    fi
    if [ $# -gt 3 ]; then
        echo "WARNING: Extra arguments will be ignored."
    fi
fi

input=$(readlink -f "$1")

if [ ! -r $input ]; then
    echo "ERROR: ${1} either doesn't exist or is not readable"
    exit 1
fi

output=$(readlink -f "$2")

singularity exec --pwd /root/DeepSEA-v0.94 "${dir}/${img}" python $cmd "$input" "$output" $3
