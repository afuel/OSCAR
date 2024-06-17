#!/bin/bash

base_dir=/work/users/${USER:0:1}/${USER:1:1}/$USER
apptainer run --nv --bind ${base_dir}/OSCAR:/oscar run.sif /bin/bash