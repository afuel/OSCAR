#!/bin/bash

source /opt/conda/etc/profile.d/conda.sh
conda activate base
cd /oscar/process-$1
./process.sh