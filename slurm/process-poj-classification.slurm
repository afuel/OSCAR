#!/bin/bash

BASE_DIR=/work/users/${USER:0:1}/${USER:1:1}/$USER && \
sbatch \
    --mail-type=FAIL \
    --mail-user=ak@cs.unc.edu \
    --job-name=process-pretrain \
    -o "/work/users/${USER:0:1}/${USER:1:1}/${USER}/OSCAR/slurm/logs/%x_%j_%N.log" \
    --nodes=1 \
    --ntasks=1 \
    --cpus-per-task=32 \
    --mem=32G \
    -p general \
    -t 12:00:00 \
    --wrap="\
        module add apptainer/1.3.0-1; \
        apptainer run --bind ${BASE_DIR}/OSCAR:/oscar ${BASE_DIR}/OSCAR/apptainer/oscar.sif \
        ${BASE_DIR}/OSCAR/slurm/process.sh poj-classification-data
        "
