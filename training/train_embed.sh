#!/bin/bash

set -x
set -e

source ../paths.sh

# download embeddings if necessary
EMBED_PATH=${MODEL_DIR}/embeddings/wiki_model.vec
if [[ ! -f ${EMBED_PATH} ]]; then
    mkdir -p ${MODEL_DIR}/embeddings
    curl -L -o ${MODEL_DIR}/embeddings/wiki_model.vec https://tinyurl.com/yb4jutxq/embeddings/wiki_model.vec
fi

SEED=1000
DATA_BIN_DIR=processed/bin
OUT_DIR=models/mlconv_embed/model${SEED}/
mkdir -p ${OUT_DIR}

CUDA_VISIBLE_DEVICES="0" python ${FAIRSEQPY}/train.py \
    ${DATA_BIN_DIR} \
    --save-dir ${OUT_DIR} \
    -a fconv \
    --encoder-embed-dim 500 --encoder-embed-path ${EMBED_PATH} \
    --decoder-embed-dim 500 --decoder-embed-path ${EMBED_PATH} --decoder-out-embed-dim 500 \
    --dropout 0.2 --clip-norm 0.1 --lr 0.25 --min-lr 1e-4 \
    --encoder-layers '[(1024,3)] * 7' --decoder-layers '[(1024,3)] * 7' \
    --momentum 0.99 --max-epoch 100 \
    --max-tokens 1000 --max-sentences 10 \
    --no-progress-bar --seed ${SEED}
