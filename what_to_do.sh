#!/bin/bash

scenes=("fern" "flower" "fortress" "leaves" "orchids" "room" "trex")

for i in ${scenes[@]}
do
    python train.py --gin_configs configs/llff3.gin \
        --gin_bindings "Config.checkpoint_dir = 'out/blendnerf_llff3_${i}_wi'" \
        --gin_bindings "Config.llff_scan = '${i}'"
    python eval.py --gin_configs configs/llff3.gin \
        --gin_bindings "Config.checkpoint_dir = 'out/blendnerf_llff3_${i}_wi'" \
        --gin_bindings "Config.llff_scan = '${i}'"
done
