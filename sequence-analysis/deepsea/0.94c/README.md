# [deepsea](https://hpc.nih.gov/apps/deepsea.html)

This is based on a Docker container where everything is installed in subdirectories within `/root`. Alot of paths are hardcoded, so we just change permissions on the root directory within the container and `cd` there before running. 

Create the following symbolic links:
```
rundeepsea.py -> deepsea.sh
rundeepsea-insilicomut.py -> deepsea.sh
```
