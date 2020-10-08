#!/bin/bash
SINGULARITY_BINDPATH="/vf,/gpfs,/spin1,/data,/scratch,/fdb,/lscratch"
export SINGULARITY_BINDPATH
CANVAS_ROOT=/usr/local/apps/Canvas/1.40
dir=$(dirname  "$0")
cmd=$(basename "$0")
args="$@"
if [ -e $CANVAS_ROOT/$cmd ]
then
  echo "Running \"singularity exec --bind /data/$USER:/mnt $CANVAS_ROOT/canvas.sif /usr/bin/dotnet /usr/local/Canvas-1.40/$cmd $args\" "
  singularity exec --bind /data/$USER:/mnt $CANVAS_ROOT/canvas.sif /usr/bin/dotnet /usr/local/Canvas-1.40/$cmd $args
else
  dir2=`echo $dir | awk -F\/ '{print $7 "/" $8}'`
  if [ -e $CANVAS_ROOT/$dir2/$cmd ]
  then
      echo "Running \"singularity exec --bind /data/$USER:/mnt $CANVAS_ROOT/canvas.sif /usr/bin/dotnet /usr/local/Canvas-1.40/$dir2/$cmd $args\" "
      singularity exec --bind /data/$USER:/mnt --pwd /mnt $CANVAS_ROOT/canvas.sif /usr/bin/dotnet /usr/local/Canvas-1.40/$dir2/$cmd $args
  else
      echo "Command $0 not found"
  fi
fi
