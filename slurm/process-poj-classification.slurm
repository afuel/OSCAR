#!/bin/bash

BASE_DIR=/work/users/${USER:0:1}/${USER:1:1}/$USER && \
sbatch \
    --mail-type=FAIL \
    --mail-user=audreyfuel33@gmail.com \
    --job-name=process-poj-classification \
    -o "/work/users/${USER:0:1}/${USER:1:1}/${USER}/OSCAR/slurm/logs/%x_%j_%N.log" \
    --nodes=1 \
    --ntasks=1 \
    --cpus-per-task=32 \
    --mem=64G \
    -p general \
    -t 12:00:00 \
    --wrap="\
        module add apptainer/1.3.0-1; \
        apptainer run --bind ${BASE_DIR}/OSCAR:/oscar ${BASE_DIR}/OSCAR/apptainer/run.sif \
        ${BASE_DIR}/OSCAR/slurm/process.sh poj-classification-data
        "
