#!/bin/bash
$(echo $LOADEDMODULES | grep singularity >& /dev/null) || ml singularity >& /dev/null
export SINGULARITY_BINDPATH="/vf,/gpfs,/spin1,/data,/lscratch,/scratch,/fdb,/usr/local/apps"
unset http_proxy # Turn off squid proxy, needed for h2o
selfdir="$(dirname $(readlink -f ${BASH_SOURCE[0]}))"
cmd="$(basename $0)"
singularity exec "${selfdir}/PaRSnIP.simg" "$cmd" "$@"
