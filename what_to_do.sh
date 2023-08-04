#!/bin/bash

scenes=("fern" "flower" "fortress" "leaves" "orchids" "room" "trex")

for i in ${scenes[@]}
do
    python train.py --gin_configs configs/llff3.gin \
        --gin_bindings "Config.checkpoint_dir = 'out/mixnerf_llff3_${i}'" \
        --gin_bindings "Config.llff_scan = '${i}'"
    python eval.py --gin_configs configs/llff3.gin \
        --gin_bindings "Config.checkpoint_dir = 'out/mixnerf_llff3_${i}'" \
        --gin_bindings "Config.llff_scan = '${i}'"
    python train.py --gin_configs configs/llff6.gin \
        --gin_bindings "Config.checkpoint_dir = 'out/mixnerf_llff6_${i}'" \
        --gin_bindings "Config.llff_scan = '${i}'"
    python eval.py --gin_configs configs/llff6.gin \
        --gin_bindings "Config.checkpoint_dir = 'out/mixnerf_llff6_${i}'" \
        --gin_bindings "Config.llff_scan = '${i}'"
    python train.py --gin_configs configs/llff9.gin \
        --gin_bindings "Config.checkpoint_dir = 'out/mixnerf_llff9_${i}'" \
        --gin_bindings "Config.llff_scan = '${i}'"
    python eval.py --gin_configs configs/llff9.gin \
        --gin_bindings "Config.checkpoint_dir = 'out/mixnerf_llff9_${i}'" \
        --gin_bindings "Config.llff_scan = '${i}'"
done